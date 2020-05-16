# How to

## Terraform

### Requirement

**Before to launch terraform apply, you must adapt variables in [00-global-variables.tf](./00-global-variables.tf)**

Make sure to update the credentials to connect to the vCenter. Hosts, template image, clusters, vSwitches, and port groups are defined on this file. 

Environment variables can be used to override variables on the [00-global-variables.tf](./00-global-variables.tf) file,

``` bash
TF_VAR_vcenter_user=admin@vsphere.local
TF_VAR_vcenter_password=Pa$$w0rd
````

### Stack creation

```bash
terraform apply
```

This script will create the following resources:

<!-- - 2 network port per pfSense deployed  -->
- X, Y, Z Ubuntu 18.04 LTS server VMs

X, Y, Z being defined on the following files;

[01-variables-u-01.tf](./01-variables-u-01.tf):

```hcl
variable "ubuntu_vm_desired_capacity_vesxi-u-01" {
  # will create 2 machines
  default = "2"
}
```


[02-variables-u-02.tf](./02-variables-u-02.tf):

```hcl
variable "ubuntu_vm_desired_capacity_vesxi-u-02" {
  # will create 2 machines
  default = "2"
}
```

[03-variables-r-03.tf](./03-variables-r-03.tf):

```hcl
variable "ubuntu_vm_desired_capacity_vesxi-r-03" {
  # will create 2 machines
  default = "2"
}
```

### Delete stack

```bash
terraform destroy
```

### Demo

TODO

## Packer 

Environment variables are used to allow Packer to connect to the vCenter,

```bash
PACKER_USERNAME=packer@vsphere.local
PACKER_PASSWORD=Pa$$w0rd2.0
```

Packer builds are defined in the [packer](./packer) directory.

### Demo

TODO

## Ansible 

Ansible uses RSA key to connect to the machines to configure, make sure to run use a remote-exec with a script injecting this key in Terrafom.

Ansible playbooks are defined in the [ansible](./ansible) diretory. Playbooks are launched from terrafrom in the [060-ubuntu_vm.tf](./060-ubuntu_vm.tf) file.