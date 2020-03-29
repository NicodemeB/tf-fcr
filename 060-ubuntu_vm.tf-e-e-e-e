#### POOL ubuntu ####
#
# Create vm ubuntu
#

############ ubuntu VM ############
#
#

resource "vsphere_virtual_machine" "ubuntu_vms" {
  count            = var.ubuntu_vm_desired_capacity_vesxi-u-01
  name             = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}"
  num_cpus         = var.ubuntu_vm_params_vesxi-u-01["vcpu"]
  memory           = var.ubuntu_vm_params_vesxi-u-01["ram"]
  datastore_id     = data.vsphere_datastore.ubuntu-vesxi-u-01.id
  host_system_id   = data.vsphere_host.vesxi-u-01.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-u-01.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_18_04.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_ubuntu_18_04.scsi_type
  annotation       = "ubuntu:ubuntu"


  # Configure network interface
#   network_interface {
#     network_id = data.vsphere_network.vesxi-u-01-pg-0.id
#   }

  network_interface {
    network_id = data.vsphere_network.ubuntu-vesxi-u-01.id
  }

  # network_interface {
  #   network_id = data.vsphere_network.pfSense-vesxi-u-01.id
  # }
  
  
  disk {
    name = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}.vmdk"
    size = var.ubuntu_vm_params_vesxi-u-01["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_18_04.id

    customize {
      linux_options {
        host_name = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}"
        domain    = var.ubuntu_network_params_vesxi-u-01["domain"]
      }

      network_interface {
        ipv4_address    = "${var.ubuntu_network_params_vesxi-u-01["base_address"]}${count.index + 10}"
        ipv4_netmask    = var.ubuntu_network_params_vesxi-u-01["prefix_length"]
        dns_server_list = var.ubuntu_network_params_vesxi-u-01["dns"]
      }

      ipv4_gateway = var.ubuntu_network_params_vesxi-u-01["gateway"]
    }
  }
  # depends_on = [vsphere_host_port_group.ubuntu_port]
  depends_on = [vsphere_host_port_group.ubuntu_port-vesxi-u-01]
  # depends_on    = [vsphere_distributed_port_group.ubuntu_port_pg_ds]
  provisioner "file" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[count.index].default_ip_address
    }
    source      = "scripts/dns-ansible.sh"
    destination = "/tmp/dns-ansible.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[count.index].default_ip_address
    }
    inline = [
      "chmod +x /tmp/dns-ansible.sh",
      # "/tmp/dns-ansible.sh args",
      "sudo /tmp/dns-ansible.sh",
    ]
  }
}




resource "vsphere_virtual_machine" "ubuntu_vm_vesxi-u-01" {
  count            = var.ubuntu_vm_desired_capacity_vesxi-u-01
  name             = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}"
  num_cpus         = var.ubuntu_vm_params_vesxi-u-01["vcpu"]
  memory           = var.ubuntu_vm_params_vesxi-u-01["ram"]
  datastore_id     = data.vsphere_datastore.ubuntu-vesxi-u-01.id
  host_system_id   = data.vsphere_host.vesxi-u-01.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-u-01.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_18_04.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_ubuntu_18_04.scsi_type
  annotation       = "ubuntu:ubuntu"


  # Configure network interface
#   network_interface {
#     network_id = data.vsphere_network.vesxi-u-01-pg-0.id
#   }

  network_interface {
    network_id = data.vsphere_network.ubuntu-vesxi-u-01.id
  }

  # network_interface {
  #   network_id = data.vsphere_network.pfSense-vesxi-u-01.id
  # }
  
  
  disk {
    name = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}.vmdk"
    size = var.ubuntu_vm_params_vesxi-u-01["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_18_04.id

    customize {
      linux_options {
        host_name = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}"
        domain    = var.ubuntu_network_params_vesxi-u-01["domain"]
      }

      network_interface {
        ipv4_address    = "${var.ubuntu_network_params_vesxi-u-01["base_address"]}${count.index + 10}"
        ipv4_netmask    = var.ubuntu_network_params_vesxi-u-01["prefix_length"]
        dns_server_list = var.ubuntu_network_params_vesxi-u-01["dns"]
      }

      ipv4_gateway = var.ubuntu_network_params_vesxi-u-01["gateway"]
    }
  }
  # depends_on = [vsphere_host_port_group.ubuntu_port]
  depends_on = [vsphere_host_port_group.ubuntu_port-vesxi-u-01]
  # depends_on    = [vsphere_distributed_port_group.ubuntu_port_pg_ds]
  provisioner "file" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[count.index].default_ip_address
    }
    source      = "scripts/dns-ansible.sh"
    destination = "/tmp/dns-ansible.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[count.index].default_ip_address
    }
    inline = [
      "chmod +x /tmp/dns-ansible.sh",
      # "/tmp/dns-ansible.sh args",
      "sudo /tmp/dns-ansible.sh",
    ]
  }
}

output "IPs-ubuntu-u-01" {
  value       = vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[*].default_ip_address
  description = "The IP addresses of all ubuntu machines on u-01"
}

resource "vsphere_virtual_machine" "ubuntu_vm_vesxi-u-02" {
  count            = var.ubuntu_vm_desired_capacity_vesxi-u-02
  name             = "${var.ubuntu_base_hostname_vesxi-u-02}${count.index + 1}"
  num_cpus         = var.ubuntu_vm_params_vesxi-u-02["vcpu"]
  memory           = var.ubuntu_vm_params_vesxi-u-02["ram"]
  datastore_id     = data.vsphere_datastore.ubuntu-vesxi-u-02.id
  host_system_id   = data.vsphere_host.vesxi-u-02.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-u-02.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_18_04.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_ubuntu_18_04.scsi_type
  annotation       = "ubuntu:ubuntu"


  # Configure network interface
#   network_interface {
#     network_id = data.vsphere_network.vesxi-u-02-pg-0.id
#   }

  network_interface {
    network_id = data.vsphere_network.ubuntu-vesxi-u-02.id
  }

  # network_interface {
  #   network_id = data.vsphere_network.pfSense-vesxi-u-02.id
  # }
  
  
  disk {
    name = "${var.ubuntu_base_hostname_vesxi-u-02}${count.index + 1}.vmdk"
    size = var.ubuntu_vm_params_vesxi-u-02["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_18_04.id

    customize {
      linux_options {
        host_name = "${var.ubuntu_base_hostname_vesxi-u-02}${count.index + 1}"
        domain    = var.ubuntu_network_params_vesxi-u-02["domain"]
      }

      network_interface {
        # ipv4_address    = "${var.ubuntu_network_params_vesxi-u-02["base_address"]}${count.index + 10 + var.ubuntu_vm_desired_capacity_vesxi-u-02}"
        ipv4_address    = "${var.ubuntu_network_params_vesxi-u-02["base_address"]}${count.index + 10}"
        ipv4_netmask    = var.ubuntu_network_params_vesxi-u-02["prefix_length"]
        dns_server_list = var.ubuntu_network_params_vesxi-u-02["dns"]
      }

      ipv4_gateway = var.ubuntu_network_params_vesxi-u-02["gateway"]
    }
  }
  # depends_on = [vsphere_host_port_group.ubuntu_port]
  depends_on = [vsphere_host_port_group.ubuntu_port-vesxi-u-02]
  # depends_on    = [vsphere_distributed_port_group.ubuntu_port_pg_ds]

  provisioner "file" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-u-02[count.index].default_ip_address
    }
    source      = "scripts/dns-ansible.sh"
    destination = "/tmp/dns-ansible.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-u-02[count.index].default_ip_address
    }
    inline = [
      "chmod +x /tmp/dns-ansible.sh",
      # "/tmp/dns-ansible.sh args",
      "sudo /tmp/dns-ansible.sh",
    ]
  }
}



resource "vsphere_virtual_machine" "ubuntu_vm_vesxi-r-03" {
  count            = var.ubuntu_vm_desired_capacity_vesxi-r-03
  name             = "${var.ubuntu_base_hostname_vesxi-r-03}${count.index + 1}"
  num_cpus         = var.ubuntu_vm_params_vesxi-r-03["vcpu"]
  memory           = var.ubuntu_vm_params_vesxi-r-03["ram"]
  datastore_id     = data.vsphere_datastore.ubuntu-vesxi-r-03.id
  host_system_id   = data.vsphere_host.vesxi-r-03.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-r-03.id
  guest_id         = data.vsphere_virtual_machine.template_ubuntu_18_04.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_ubuntu_18_04.scsi_type
  annotation       = "ubuntu:ubuntu"


  # Configure network interface
#   network_interface {
#     network_id = data.vsphere_network.vesxi-r-03-pg-0.id
#   }

  network_interface {
    network_id = data.vsphere_network.ubuntu-vesxi-r-03.id
  }
  
  # network_interface {
  #   network_id = data.vsphere_network.pfSense-vesxi-r-03.id
  # }

  disk {
    name = "${var.ubuntu_base_hostname_vesxi-r-03}${count.index + 1}.vmdk"
    size = var.ubuntu_vm_params_vesxi-r-03["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_ubuntu_18_04.id

    customize {
      linux_options {
        host_name = "${var.ubuntu_base_hostname_vesxi-r-03}${count.index + 1}"
        domain    = var.ubuntu_network_params_vesxi-r-03["domain"]
      }

      network_interface {
        # ipv4_address    = "${var.ubuntu_network_params_vesxi-r-03["base_address"]}${count.index + 10 + var.ubuntu_vm_desired_capacity_vesxi-u-02 + var.ubuntu_vm_desired_capacity_vesxi-r-03}"
        ipv4_address    = "${var.ubuntu_network_params_vesxi-r-03["base_address"]}${count.index + 10}"
        ipv4_netmask    = var.ubuntu_network_params_vesxi-r-03["prefix_length"]
        dns_server_list = var.ubuntu_network_params_vesxi-r-03["dns"]
      }

      ipv4_gateway = var.ubuntu_network_params_vesxi-r-03["gateway"]
    }
  }
  # depends_on = [vsphere_host_port_group.ubuntu_port]
  depends_on = [vsphere_host_port_group.ubuntu_port-vesxi-r-03]
  # depends_on    = [vsphere_distributed_port_group.ubuntu_port_pg_ds]

  provisioner "file" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-r-03[count.index].default_ip_address
    }
    source      = "scripts/dns-ansible.sh"
    destination = "/tmp/dns-ansible.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = vsphere_virtual_machine.ubuntu_vm_vesxi-r-03[count.index].default_ip_address
    }
    inline = [
      "chmod +x /tmp/dns-ansible.sh",
      # "/tmp/dns-ansible.sh args",
      "sudo /tmp/dns-ansible.sh",
    ]
  }
}
