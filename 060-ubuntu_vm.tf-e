#### POOL ubuntu ####
#
# Create vm ubuntu
#

############ ubuntu VM ############
#
#
####Attempt at looping - works with 1 item but not ith 2 ... - BEGIN
# resource "vsphere_virtual_machine" "ubuntu_vms" {
#   count            = length(var.ubuntu_vms)
#   name             = "${var.ubuntu_vms[count.index]["name"]}${count.index + 1}"
#   num_cpus         = var.ubuntu_vm_params_vesxi-u-01["vcpu"]
#   memory           = var.ubuntu_vm_params_vesxi-u-01["ram"]
#   datastore_id     = data.vsphere_datastore.ubuntu-vesxi-u-01.id
#   host_system_id   = data.vsphere_host.vesxi-u-01.id
#   resource_pool_id = data.vsphere_resource_pool.vesxi-u-01.id
#   guest_id         = data.vsphere_virtual_machine.template_ubuntu_18_04.guest_id
#   scsi_type        = data.vsphere_virtual_machine.template_ubuntu_18_04.scsi_type
#   annotation       = "ubuntu:ubuntu"


#   # Configure network interface
# #   network_interface {
# #     network_id = data.vsphere_network.vesxi-u-01-pg-0.id
# #   }

#   network_interface {
#     network_id = data.vsphere_network.ubuntu-vesxi-u-01.id
#   }

#   # network_interface {
#   #   network_id = data.vsphere_network.pfSense-vesxi-u-01.id
#   # }
  
  
#   disk {
#     name = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}.vmdk"
#     size = var.ubuntu_vm_params_vesxi-u-01["disk_size"]
#   }

#   # Define template and customisation params
#   clone {
#     template_uuid = data.vsphere_virtual_machine.template_ubuntu_18_04.id

#     customize {
#       linux_options {
#         host_name = "${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}"
#         domain    = var.ubuntu_network_params_vesxi-u-01["domain"]
#       }

#       network_interface {
#         ipv4_address    = var.ubuntu_vms[count.index]["ip"]
#         ipv4_netmask    = var.ubuntu_network_params_vesxi-u-01["prefix_length"]
#         dns_server_list = var.ubuntu_network_params_vesxi-u-01["dns"]
#       }

#       ipv4_gateway = var.ubuntu_network_params_vesxi-u-01["gateway"]
#     }
#   }
#   # depends_on = [vsphere_host_port_group.ubuntu_port]
#   depends_on = [vsphere_host_port_group.ubuntu_port-vesxi-u-01]
#   # depends_on    = [vsphere_distributed_port_group.ubuntu_port_pg_ds]
#   provisioner "file" {
#     connection {
#       type     = "ssh"
#       user     = "ubuntu"
#       password = "ubuntu"
#       host     = vsphere_virtual_machine.ubuntu_vms[count.index].default_ip_address
#     }
#     source      = "scripts/dns-ssh.sh"
#     destination = "/tmp/dns-ssh.sh"
#   }

#   provisioner "remote-exec" {
#     connection {
#       type     = "ssh"
#       user     = "ubuntu"
#       password = "ubuntu"
#       host     = vsphere_virtual_machine.ubuntu_vms[count.index].default_ip_address
#     }
#     inline = [
#       "chmod +x /tmp/dns-ssh.sh",
#       # "/tmp/dns-ssh.sh args",
#       "sudo /tmp/dns-ssh.sh",
#     ]
#   }
# }

# output "IPs_ubuntu_vms" {
#   value       = [vsphere_virtual_machine.ubuntu_vms[*].name, vsphere_virtual_machine.ubuntu_vms[*].default_ip_address]
#   # value       = join("~> ", [vsphere_virtual_machine.ubuntu_vms[*].name, vsphere_virtual_machine.ubuntu_vms[*].default_ip_address])
#   # value = [for default_ip_address in vsphere_virtual_machine.ubuntu_vms : "is the ${default_ip_address}"]
#   description = "The IP addresses of all ubuntu machines"
# }
####Attempt at looping - works with 1 item but not ith 2 ... - END


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
        ipv4_address    = cidrhost(var.ubuntu_network_params_vesxi-u-01["subnet"], count.index + 10)
        ipv4_netmask    = split("/", var.ubuntu_network_params_vesxi-u-01["subnet"])[1]
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
      # host     = "1.1.1.1"
      host     = cidrhost(var.ubuntu_network_params_vesxi-u-01["subnet"], count.index + 10)
    }
    source      = "scripts/dns-ssh.sh"
    destination = "/tmp/dns-ssh.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = cidrhost(var.ubuntu_network_params_vesxi-u-01["subnet"], count.index + 10)
    }
    inline = [
      "chmod +x /tmp/dns-ssh.sh",
      # "/tmp/dns-ssh.sh args",
      "sudo /tmp/dns-ssh.sh",
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook ansible/zsh/playbook.yml -u ubuntu -i ${cidrhost(var.ubuntu_network_params_vesxi-u-01["subnet"], count.index + 10)},"
  }

  provisioner "local-exec" {
    command = "ansible-playbook ansible/apache2/playbook.yml -u ubuntu -i ${cidrhost(var.ubuntu_network_params_vesxi-u-01["subnet"], count.index + 10)}, -e 'http_host=${var.ubuntu_base_hostname_vesxi-u-01}${count.index + 1}'"
  }
}

output "IPs-ubuntu-u-01" {
  value       = [vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[*].name, vsphere_virtual_machine.ubuntu_vm_vesxi-u-01[*].default_ip_address]
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
        ipv4_address    = cidrhost(var.ubuntu_network_params_vesxi-u-02["subnet"], count.index + 10)
        ipv4_netmask    = split("/", var.ubuntu_network_params_vesxi-u-02["subnet"])[1]
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
      host     = cidrhost(var.ubuntu_network_params_vesxi-u-02["subnet"], count.index + 10)
    }
    source      = "scripts/dns-ssh.sh"
    destination = "/tmp/dns-ssh.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = cidrhost(var.ubuntu_network_params_vesxi-u-02["subnet"], count.index + 10)
    }
    inline = [
      "chmod +x /tmp/dns-ssh.sh",
      # "/tmp/dns-ssh.sh args",
      "sudo /tmp/dns-ssh.sh",
    ]
  }
  provisioner "local-exec" {
    command = "ansible-playbook ansible/apache2/playbook.yml -u ubuntu -i ${cidrhost(var.ubuntu_network_params_vesxi-u-02["subnet"], count.index + 10)}, -e 'http_host=${var.ubuntu_base_hostname_vesxi-u-02}${count.index + 1}'"
  }

}

output "IPs-ubuntu-u-02" {
  value       = [vsphere_virtual_machine.ubuntu_vm_vesxi-u-02[*].name, vsphere_virtual_machine.ubuntu_vm_vesxi-u-02[*].default_ip_address]
  description = "The IP addresses of all ubuntu machines on u-01"
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
        ipv4_address    = cidrhost(var.ubuntu_network_params_vesxi-r-03["subnet"], count.index + 10)
        ipv4_netmask    = split("/", var.ubuntu_network_params_vesxi-r-03["subnet"])[1]
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
      host     = cidrhost(var.ubuntu_network_params_vesxi-r-03["subnet"], count.index + 10)
    }
    source      = "scripts/dns-ssh.sh"
    destination = "/tmp/dns-ssh.sh"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      password = "ubuntu"
      host     = cidrhost(var.ubuntu_network_params_vesxi-r-03["subnet"], count.index + 10)
    }
    inline = [
      "chmod +x /tmp/dns-ssh.sh",
      # "/tmp/dns-ssh.sh args",
      "sudo /tmp/dns-ssh.sh",
    ]
  }
  provisioner "local-exec" {
    command = "ansible-playbook ansible/apache2/playbook.yml -u ubuntu -i ${cidrhost(var.ubuntu_network_params_vesxi-r-03["subnet"], count.index + 10)}, -e 'http_host=${var.ubuntu_base_hostname_vesxi-r-03}${count.index + 1}'"
  }
}

output "IPs-ubuntu-r-03" {
  value       = [vsphere_virtual_machine.ubuntu_vm_vesxi-r-03[*].name, vsphere_virtual_machine.ubuntu_vm_vesxi-r-03[*].default_ip_address]
  description = "The IP addresses of all ubuntu machines on u-01"
}
