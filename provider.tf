provider "ibm" {
  softlayer_username = "${var.ibm_sl_username}"
  softlayer_api_key  = "${var.ibm_sl_api_key}"
  softlayer_timeout  = "300"
  bluemix_api_key = "${var.ibm_platform_api_key}"
}
