# terraform-ibm-openshift-origin

Use this project to set up Red Hat® OpenShift Origin  3.11 on IBM Cloud, using Terraform.

## Overview
Deployment of 'OpenShift Origin on IBM Cloud' is divided into separate steps.

* Step 1: Provision the infrastructure on IBM Cloud <br>
  Use Terraform to provision the compute, storage, network resources on IBM Cloud Infrastructure

* Step 2: Deploy OpenShift Container Platform on IBM Cloud <br>
  Install OpenShift Origin which is done using the Ansible playbooks - available in the https://github.com/openshift/openshift-ansible project.
  During this phase the router and registry are deployed.

* Step 3: Post deployment activities <br>
  Validate the deployment

The following figure illustrates the deployment architecture for the 'OpenShift Origin on IBM Cloud'.

![Infrastructure Diagram](./docs/infra-diagram.png)

## Prerequisite

* Terraform installed on your local system [Download Terraform](https://www.terraform.io/downloads.html)

* IBM Cloud account (used to provision resources on IBM Cloud Infrastructure or SoftLayer)


## Steps to install a OpenShift Origin Cluster


* Clone the repo [IBM Terraform Openshift Origin](https://github.com/IBM-Cloud/terraform-ibm-openshift)

    ``` console
    # Clone the repo
    $ git clone https://github.com/IBM-Cloud/terraform-ibm-openshift.git
    $ cd terraform-ibm-openshift/
    ```

* Generate the private and public key pair which is required to provision and then access the  virtual machines in softlayer.

* Put both keys (*id_rsa* and *id_rsa.pub*) in the **keys** subfolder.Follow the instruction [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) to generate ssh key pair


### 2. Provision the IBM Cloud Infrastructure for Red Hat® OpenShift Origin

* Update variables.tf file with datacenter, vlans, IBM Cloud infrastructure username , infrastructure key and api_key ,  and ssh keys to proceed.

* Provision the infrastructure using the following command

   ``` console
   # Create the infrastructure.
   $ make infrastructure
   ```
Please provide IBM Cloud infrastructure username , infrastructure key and api_key ,  and ssh public key to proceed.

In this version, the following infrastructure elements are provisioned for OpenShift (as illustrated in the picture)
* Master node
* Infra node
* App node
* Security groups for these nodes


On successful completion, you will see a message like the following
   ```
   ...

   Apply complete! Resources: 63 added, 0 changed, 0 destroyed.

   ```

### 3. Prepare nodes for  Openshift Origin install

* Install the repos and images by running :

  ``` console
    $ make preparenodes
  ```

### 4. Deploy OpenShift Origin on IBM Cloud Infrastructure

To install OpenShift on the cluster, just run:
   ``` console
   $ make openshift
   ```

This step includes the following:
* Prepare the Master, Infra and App nodes before installing OpenShift
* Finally, install OpenShift Origin v3.11 using installation procedure described [here]( https://docs.okd.io/3.11/install/running_install.html).


Once the setup is complete, just run:

   ``` console
   $ open https://$(terraform output master_public_ip):8443/console
   ```
Note: Add IP and Host Entry in /etc/hosts

This figure illustrates the 'Red Hat Openshift Console'

![Openshift Console](https://github.com/IBM-Cloud/terraform-ibm-openshift/blob/master/docs/ose-console-3.9.png)

To open a browser to admin console, use the following credentials to login:
   ``` console
   Username: admin
   Password: test123
   ```

## Work with OpenShift

* Login to the master node

  ``` console
   $ ssh -t -A root@$(terraform output master_public_ip)
  ```
  Default project is in use and the core infrastructure components (router etc) are available.

* Login to openshift client by running

  ``` console
    $ oc login https://$(terraform output master_public_ip):8443
  ```

  Provide username as admin and password as test123 to login to the openshift client.

* Create new project

  ``` console
   $ oc new-project test

  ```

* Deploy the app

  ``` console
   $ oc new-app --name=nginx --docker-image=bitnami/nginx

  ```
* Expose the service

  ``` console
   $ oc expose svc/nginx

  ```
* Edit the service to use nodePort by changing type as NodePort

  ``` console
   $ oc edit svc/nginx

  ```

  Access the deployed application at

  ``` console
   $ oc get routes

  ```

  ```
  {HOST/PORT} get the value from above command
  Access the deployed application at http${HOST/PORT}

  ```


## Destroy the OpenShift cluster

Bring down the openshift cluster by running following

  ``` console
   $ make destroy

  ```

## Troubleshooting

\[Work in Progress\]

# References

* https://github.com/dwmkerr/terraform-aws-openshift - Inspiration for this project

* https://github.com/ibm-cloud/terraform-provider-ibm - Terraform Provider for IBM Cloud  

* [Deploying OpenShift Origin 3.11](https://docs.okd.io/3.11/install/running_install.html)

* [To create more users and provide admin privilege](https://docs.openshift.com/container-platform/3.10/install_config/configuring_authentication.html)

* [Accessing openshift registry](https://docs.openshift.com/container-platform/3.10/install_config/registry/index.html)

* [Refer Openshift Router](https://docs.openshift.com/container-platform/3.10/install_config/router/index.html)
