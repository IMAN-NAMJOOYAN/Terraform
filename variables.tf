variable "vsphere_server" {
description = "VSphere Or VCenterHost IP Address"
}

variable "vsphere_user" {
description = "VSphere user name"
}

variable "vsphere_password" {
description = "VSphere password"
}

variable "resource_pool_designator" {
  description = "The name of the resource pool"
}

variable "vcenter_dataceneter_name" {
description = "VCenter datacenter name"
}

variable "vsphere_datastore_name" {
description = "VSphere datastore name"
}

variable "vsphere_network_name" {
description = "VSphere network name: (Example: VLAN14)"
}

variable "vsphere_virtual_machine_name" {
description = "VSphere virtual machine name"
}

#================================ CPU variables
variable "num_cpus_count" {
description = "set number of cpu cores"
}

variable "num_cores_per_socket_count" {
description = "virtual machine: number of cores"
}

variable "cpu_hot_add" {
description = "cpu hot add enabled"
}
#================================ Memory variables
variable "memory_capacity" {
description = "set memory capacity(MB)"
}

variable "memory_hot_add" {
description = "memory hot add enabled"
}

#==================================
variable "guest_id_osguest" {
description = "set guest OS(Example: oracleLinux6_64Guest, oracleLinux7_64Guest, oracleLinux8_64Guest, centos7_64Guest"
}

variable "firmware_type" {
description = "virtual machine firmware type: bios/efi"
}

variable "disk_capacity" {
description = "set disk capacity(GB)"
}

