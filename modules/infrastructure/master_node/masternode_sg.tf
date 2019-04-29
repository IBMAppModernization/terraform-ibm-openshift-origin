//Ose master sg
resource "ibm_security_group" "openshift-master" {
  name        = "${var.master_sg_name}-${var.random_id}"
  description = "${var.master_sg_description}"
}

resource "ibm_security_group_rule" "openshift-master-ingress_rule1" {
  direction         = "ingress"
  security_group_id = "${ibm_security_group.openshift-master.id}"
}


resource "ibm_security_group_rule" "openshift-master-egress_rule1" {
  direction         = "egress"
  security_group_id = "${ibm_security_group.openshift-master.id}"
}
