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
# Infra Node Variables
#################################################
variable "infra_node_count" {}

variable "infra_hostname" {
  default = "infra"
}
variable "infra_hostname_prefix" {
  default = "okd311"
}
variable "infra_flavor" {}
variable "infra_os_ref_code" {
  default = "CENTOS_7_64"
}
variable "infra_node_pub_sg"{}
variable "infra_node_prv_sg"{}
variable "infra_ssh_key_ids" {
  type = "list"
}
variable "infra_private_ssh_key" {}
