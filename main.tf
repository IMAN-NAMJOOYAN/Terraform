#################################################### Configure the vSphere Provider
provider "vsphere" {
    vsphere_server = "${var.vsphere_server}"
    user = "${var.vsphere_user}"
    password = "${var.vsphere_password}"
    allow_unverified_ssl = true
}
################################################### Build Customized VM
data "vsphere_datacenter" "dc" {
  name = "${var.vcenter_dataceneter_name}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.resource_pool_designator}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "mgmt_lan" {
  name          = "${var.vsphere_network_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name                       = "${var.vsphere_virtual_machine_name}"
  resource_pool_id           = "${data.vsphere_resource_pool.pool.id}"
  datastore_id               = "${data.vsphere_datastore.datastore.id}"
  num_cpus                   = "${var.num_cpus_count}"
  num_cores_per_socket       = "${var.num_cores_per_socket_count}"
  cpu_hot_add_enabled        = "${var.cpu_hot_add}"
  memory                     = "${var.memory_capacity}"
  memory_hot_add_enabled     = "${var.memory_hot_add}"
  wait_for_guest_net_timeout = 0
  guest_id                   = "${var.guest_id_osguest}"
  nested_hv_enabled          = true
  network_interface {
   network_id     = "${data.vsphere_network.mgmt_lan.id}"
   adapter_type   = "vmxnet3"
  }

  disk {
   size             = "${var.disk_capacity}"
   label            = "${var.vsphere_virtual_machine_name}.vmdk"
   eagerly_scrub    = false
   thin_provisioned = true
  }

}
