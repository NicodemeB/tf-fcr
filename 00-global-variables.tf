# Configure the VMware vSphere Provider
# You can use vcenter login params or simply host esxi login params

variable "vcenter_user" {
  default = "user"
}

variable "vcenter_password" {
  default = "password"
}

variable "vcenter_vsphere_server" {
  default = "vcenterserver.rack"
}


provider "vsphere" {
  # If you use a domain set your login like this "MyDomain\\MyUser"
  user           = var.vcenter_user
  password       = var.vcenter_password
  vsphere_server = var.vcenter_vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

#### TEMPLATES

# You must add template in vsphere before use it
variable "template_image_ubuntu_18_04" {
  # default = "CentOS7-TEMPLATE-FCR-TEST"
  # default = "UbuntuS-18.04-LTS-TEMPLATE-FCR"
  default = "Packer-Ubuntu-18.04-TEMPLATE-FCR"
}


#### DC AND CLUSTER
# # Set vpshere datacenter
variable "dc" {
  default = "FCR"
}

# Set host where you want deploy your vm
variable "hosts" {
  default = [
    {
      name = "vesxi-u-01"
      hostname = "vesxi-u-01.rack"
    },
    {
      name = "vesxi-u-02"
      hostname = "vesxi-u-02.rack"
    },
    {
      name = "vesxi-r-03"
      hostname = "vesxi-r-03.rack"
    }
  ]
}

# output "DEBUG" {
#   value = [for host in var.hosts : "${host.name} ${host.hostname}"]
# }

# Set cluster where you want deploy your vm
variable "clusters" {
  type = map

  default = {
    vesxi-u-01 = "vesxi-u-01.rack"
    vesxi-u-02 = "vesxi-u-02.rack"
    vesxi-r-03 = "vesxi-r-03.rack"
  }
}

#### GLOBAL NETWORK PARAMS
# Virtual switch used
variable "vswitches" {
  type = map

  default = {
    vesxi-u-01-vs-0 = "vSwitch0"
    vesxi-u-01-vs-1 = "vSwitch1"
    vesxi-u-02-vs-0 = "vSwitch0"
    vesxi-u-02-vs-1 = "vSwitch1"
    vesxi-r-03-vs-0 = "vSwitch0"
    vesxi-r-03-vs-1 = "vSwitch1"
  }
}
# Virtual switch used
variable "port_groups" {
  type = map

  default = {
    vesxi-u-01-pg-0 = "VM Network - vesxi-u-01"
    vesxi-u-02-pg-0 = "VM Network - vesxi-u-02"
    vesxi-r-03-pg-0 = "VM Network - vesxi-r-03"
  }
}


# variable "ubuntu_vms" {
#   default = [
#     {
#       name = "ubuntu-u-01-loop"
#       num_cpus         = 1
#       memory           = 2048
#       ip = "172.10.0.100"
#       host = "vesxi-u-01.rack"
#     },
#     {
#       name = "ubuntu-u-02-loop"
#       num_cpus         = 1
#       memory           = 2048
#       ip = "172.10.0.101"
#       host = "vesxi-u-01.rack"
#     }
#   ]
# }
