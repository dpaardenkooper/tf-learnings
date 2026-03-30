module "training_vm" {
  source = "./modules/vsphere-vm"

  datacenter_name = var.datacenter_name
  cluster_name    = var.cluster_name
  datastore_name  = var.datastore_name
  network_name    = var.network_name

  name          = var.vm_name
  domain        = var.vm_domain
  folder        = var.vm_folder
  create_folder = true

  template_name = var.vm_template_name

  num_cpus = var.vm_num_cpus
  memory   = var.vm_memory

  ipv4_address = var.vm_ipv4_address
  ipv4_netmask = var.vm_ipv4_netmask
  ipv4_gateway = var.vm_ipv4_gateway
}
