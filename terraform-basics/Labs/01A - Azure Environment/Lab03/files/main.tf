data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

locals {
  location = coalesce(var.location, data.azurerm_resource_group.rg.location)
  prefix   = "${var.name_prefix}-${substr(replace(lower(data.azurerm_resource_group.rg.name), "/[^a-z0-9]/", ""), 0, 10)}"

  bastion_nsg_rules = [
    # Inbound
    {
      name      = "AllowBastionDataPlaneInbound"
      prio      = 130
      dir       = "Inbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "VirtualNetwork"
      dst       = "VirtualNetwork"
      dst_ports = ["8080", "5701"]
    },
    {
      name      = "AllowHttpsInbound"
      prio      = 100
      dir       = "Inbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "Internet"
      dst       = "*"
      dst_ports = ["443"]
    },
    {
      name      = "AllowGatewayManagerInbound"
      prio      = 110
      dir       = "Inbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "GatewayManager"
      dst       = "*"
      dst_ports = ["443"]
    },
    {
      name      = "AllowAzureLoadBalancerInbound"
      prio      = 120
      dir       = "Inbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "AzureLoadBalancer"
      dst       = "*"
      dst_ports = ["443"]
    },

    # Outbound
    {
      name      = "AllowSshRdpOutbound"
      prio      = 100
      dir       = "Outbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "*"
      dst       = "VirtualNetwork"
      dst_ports = ["22", "3389"]
    },
    {
      name      = "AllowAzureCloudOutbound"
      prio      = 110
      dir       = "Outbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "*"
      dst       = "AzureCloud"
      dst_ports = ["443"]
    },
    # Optional but commonly needed
    {
      name      = "AllowInternetHttpOutbound"
      prio      = 120
      dir       = "Outbound"
      acc       = "Allow"
      proto     = "Tcp"
      src       = "*"
      dst       = "Internet"
      dst_ports = ["80"]
    },
    # Bastion internal comms
    {
      name      = "AllowBastionInternalOutbound"
      prio      = 130
      dir       = "Outbound"
      acc       = "Allow"
      proto     = "*"
      src       = "VirtualNetwork"
      dst       = "VirtualNetwork"
      dst_ports = ["8080", "5701"]
    },
  ]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.prefix}-vnet"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "${local.prefix}-subnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

# Required name for Bastion subnet
resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.2.0/26"]
}

# Public IP for Bastion only (VM has NO public IP)
resource "azurerm_public_ip" "bastion_pip" {
  name                = "${local.prefix}-bastion-pip"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_security_group" "vm_nsg" {
  name                = "${local.prefix}-vm-nsg"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name

  # Allow SSH ONLY from Azure Bastion subnet to the VM subnet
  security_rule {
    name                       = "Allow-SSH-From-Bastion"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = azurerm_subnet.bastion_subnet.address_prefixes[0]
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "bastion_nsg" {
  name                = "${local.prefix}-bastion-nsg"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg" {
  subnet_id                 = azurerm_subnet.bastion_subnet.id
  network_security_group_id = azurerm_network_security_group.bastion_nsg.id
}

resource "azurerm_network_security_rule" "bastion_rules" {
  for_each = { for r in local.bastion_nsg_rules : r.name => r }

  name      = each.value.name
  priority  = each.value.prio
  direction = each.value.dir
  access    = each.value.acc
  protocol  = each.value.proto

  source_port_range       = "*"
  destination_port_ranges = each.value.dst_ports

  source_address_prefix      = each.value.src
  destination_address_prefix = each.value.dst

  resource_group_name         = data.azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.bastion_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "vm_subnet_nsg" {
  subnet_id                 = azurerm_subnet.vm_subnet.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}

resource "azurerm_network_interface" "nic" {
  name                = "${local.prefix}-nic"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${local.prefix}-vm"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
  size                = "Standard_B1s"

  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_username = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(pathexpand(var.ssh_public_key_path))
  }

  # System-assigned managed identity (simplest for a first lab)
  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "${local.prefix}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true
}

resource "azurerm_bastion_host" "bastion" {
  name                = "${local.prefix}-bastion"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "Basic"

  ip_configuration {
    name                 = "bastion-ipconfig"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}
