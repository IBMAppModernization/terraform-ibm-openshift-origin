infrastructure:
	# Get the modules, create the infrastructure.
	terraform init && terraform get && terraform apply --target=ibm_compute_ssh_key.ssh_key_openshift --target=random_id.os_name --target=module.network --target=module.publicsg --target=module.privatesg   --target=module.masternode --target=module.appnode --target=module.infranode --target=module.inventory --auto-approve

preparenodes:
	terraform init && terraform get && terraform apply --target=module.preparenodes --auto-approve

openshift:
	# Get the modules, for the pre install steps.
	terraform init && terraform get && terraform apply  --target=module.openshift --auto-approve


destroy:
	# terraform init && terraform get && terraform destroy --target=module.loadbalancer --parallelism=1 --auto-approve
	terraform init && terraform get && terraform destroy --auto-approve
