variable "pfSense_network_params_vesxi-u-02" {
  default = {
    domain        = "test.local"
    label         = "pfSense_network_vesxi-u-02"
    vlan_id       = "0"
    # base_address  = "172.16.27."
    # prefix_length = "20"
    # gateway       = "172.16.31.254"
  }
}

variable "ubuntu_vm_params_vesxi-u-02" {
  default = {
    vcpu = "1"
    ram  = "2048"
    # You can't set a datastore name with interspace
    disk_datastore = "vESXI-U-02-DS1"
    disk_size      = "25"
  }
}

variable "ubuntu_network_params_vesxi-u-02" {
  default = {
    domain        = "test.local"
    label         = "ubuntu_network_vesxi-u-02"
    vlan_id       = "0"
    # base_address  = "172.11.0."
    # prefix_length = "24"
    subnet        = "172.11.0.0/24"
    gateway       = "172.11.0.254"
    dns           = ["8.8.8.8", "8.8.4.4"]
  }
}

variable "ubuntu_base_hostname_vesxi-u-02" {
  default = "u-02-ubuntu0"
}

variable "ubuntu_vm_desired_capacity_vesxi-u-02" {
  default = "5"
}

