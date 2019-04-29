#################################################
# Common Variables
#################################################
variable "random_id" {}
variable "datacenter" {}
variable "domain" {}
variable "private_vlan_id" {}
variable "public_vlan_id" {}
variable "hourly_billing" {}


#################################################
# Master Node Variables
#################################################
variable "master_node_count" {}
variable "master_hostname" {
  default = "master"
}
variable "master_hostname_prefix" {
  default = "okd311"
}
variable "master_flavor" {}
variable "master_os_ref_code" {
  default = "CENTOS_7_64"
}

variable "master_ssh_key_ids" {
  type = "list"
}
variable "master_ssh_key_id" {}
variable "master_private_ssh_key" {}

variable "master_sg_name" {
  default     = "os_master_sg"
  description = "Name of the security group"
}

variable "master_sg_description" {
  default     = "master security grp for vms"
  description = "Description of the security group"
}
