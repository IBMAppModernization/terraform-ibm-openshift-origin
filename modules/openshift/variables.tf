variable "master_ip_address" {}
variable "master_private_ssh_key" {}

variable "master_private_ip" {
  type="list"
}
variable "infra_private_ip" {
   type="list"
}
variable "app_private_ip" {
   type="list"
}

variable "master_host" {
   type = "list"
}

variable "infra_host" {
   type = "list"
}

variable "app_host" {
   type = "list"
}

variable "domain" {

}
