variable "pfSense_network_params_vesxi-r-03" {
  default = {
    domain        = "test.local"
    label         = "pfSense_network_vesxi-r-03"
    vlan_id       = "0"
    # base_address  = "172.16.27."
    # prefix_length = "20"
    # gateway       = "172.16.31.254"
  }
}

variable "ubuntu_vm_params_vesxi-r-03" {
  default = {
    vcpu = "4"
    ram  = "4096"
    # You can't set a datastore name with interspace
    disk_datastore = "vESXI-R-03-DS1"
    disk_size      = "25"
  }
}

variable "ubuntu_network_params_vesxi-r-03" {
  default = {
    domain        = "test.local"
    label         = "ubuntu_network_vesxi-r-03"
    vlan_id       = "0"
    # base_address  = "172.12.0."
    # prefix_length = "24"
    subnet        = "172.12.0.0/24"
    gateway       = "172.12.0.254"
    dns           = ["8.8.8.8", "8.8.4.4"]
  }
}

variable "ubuntu_base_hostname_vesxi-r-03" {
  default = "r-03-ubuntu0"
}

variable "ubuntu_vm_desired_capacity_vesxi-r-03" {
  default = "2"
}
