
resource "null_resource" "setup_app" {
count = "${var.app_count}"
  connection {
    type     = "ssh"
    user     = "root"
    host = "${element(var.app_ip_address, count.index)}"
    private_key = "${file(var.app_private_ssh_key)}"
  }
  provisioner "file" {
    source      = "${path.cwd}/scripts"
    destination = "/tmp"

  }


    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      ]

    }

}

resource "null_resource" "setup_infra" {
count = "${var.infra_count}"
  connection {
    type     = "ssh"
    user     = "root"
    host = "${element(var.infra_ip_address, count.index)}"
    private_key = "${file(var.infra_private_ssh_key)}"
  }
  provisioner "file" {
    source      = "${path.cwd}/scripts"
    destination = "/tmp"

  }


    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      ]

    }

}

resource "null_resource" "setup_master" {
count = "${var.master_count}"
  connection {
    type     = "ssh"
    user     = "root"
    host = "${element(var.master_ip_address, count.index)}"
    private_key = "${file(var.master_private_ssh_key)}"
  }


 provisioner "file" {
    source      = "${path.cwd}/scripts"
    destination = "/tmp"

  }



    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      ]

    }

}
