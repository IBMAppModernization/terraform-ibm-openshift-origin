//  This security group allows public ingress to the instances for HTTP, HTTPS
//  and common HTTP/S proxy ports.

#ose_node_sg
resource "ibm_security_group" "openshift-node" {
  name        = "${var.node_sg_name}-${var.random_id}"
  description = "${var.node_sg_description}"
}

resource "ibm_security_group_rule" "openshift-node-ingress_rule1" {
  direction         = "ingress"
  security_group_id = "${ibm_security_group.openshift-node.id}"
}


resource "ibm_security_group_rule" "openshift-node-egress_rule1" {
  direction         = "egress"
  security_group_id = "${ibm_security_group.openshift-node.id}"
}
