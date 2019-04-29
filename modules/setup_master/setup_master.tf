resource "null_resource" "setup_bastion" {

  connection {
    type     = "ssh"
    user     = "root"
    host = "${var.master_ip_address}"
    private_key = "${file(var.private_ssh_key)}"
  }
  provisioner "file" {
    source      = "${path.cwd}/scripts"
    destination = "/tmp"

  }

  provisioner "file" {
    source      = "${path.cwd}/inventory_repo/"
    destination = "/tmp/scripts"
  }


    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      "/tmp/scripts/master_install_ansible.sh",
    ]

    }

}


variable "bastion_ip_address" {

}


variable "private_ssh_key" {

}

variable "rhn_username"{

}

variable "rhn_password"{

}

variable "pool_id"{

}
