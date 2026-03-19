# Lookup existing infrastructure
data "vsphere_datacenter" "dc" {
  name = var.datacenter
}
 
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_virtual_machine" "template" {
  name          = var.template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Create the VM
resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  folder           = var.vm_folder
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
 
  num_cpus  = 2
  memory    = 4096
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
 
  firmware = data.vsphere_virtual_machine.template.firmware
 
  network_interface {
    network_id      = data.vsphere_network.network.id
    adapter_type    = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
 
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
  }
 
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
 
    customize {
      linux_options {
        host_name = var.vm_name
        domain    = var.vm_domain
      }
 
      network_interface {
        ipv4_address = var.vm_ip_address
        ipv4_netmask = var.vm_ip_netmask
      }
 
      ipv4_gateway = var.vm_ip_gateway
    }
  }
 
  wait_for_guest_net_timeout = 0
}
 