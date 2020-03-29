
resource "vsphere_virtual_machine" "pfSense_vm_vesxi-u-01" {
  count            = var.pfSense_vm_desired_capacity_vesxi-u-01
  name             = "${var.pfSense_base_hostname_vesxi-u-01}${count.index + 1}"
  num_cpus         = var.pfSense_vm_params_vesxi-u-01["vcpu"]
  memory           = var.pfSense_vm_params_vesxi-u-01["ram"]
  datastore_id     = data.vsphere_datastore.pfSense-vesxi-u-01.id
  host_system_id   = data.vsphere_host.vesxi-u-01.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-u-01.id
  guest_id         = data.vsphere_virtual_machine.template_pfSense-u-01.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_pfSense-u-01.scsi_type
  # wait_for_guest_net_routable = false
  # wait_for_guest_ip_timeout = 0
  wait_for_guest_net_timeout = 0


  # Configure network interface
  network_interface {
    # network_id = data.vsphere_network.vesxi-u-01-pg-0.id
    network_id = data.vsphere_network.pfSense-vesxi-u-01-out.id
    use_static_mac = true
    mac_address = "1a:1a:1a:00:00:01"
  }

  network_interface {
    network_id = data.vsphere_network.pfSense-vesxi-u-01-in.id
  }
  
  
  disk {
    name = "${var.pfSense_base_hostname_vesxi-u-01}${count.index + 1}.vmdk"
    size = var.pfSense_vm_params_vesxi-u-01["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_pfSense-u-01.id

  }
  # depends_on = [vsphere_host_port_group.pfSense_port-vesxi-u-01]
  depends_on = [data.vsphere_network.pfSense-vesxi-u-01-out, data.vsphere_network.pfSense-vesxi-u-01-in]

  # provisioner "local-exec" {
  #   command = "Sleep 90" //hack to wait for boot
  # }
  # provisioner "remote-exec" {
  #   connection {
  #     type     = "ssh"
  #     user     = var.pfSense_credentials_vesxi-u-01.user
  #     password = var.pfSense_credentials_vesxi-u-01.password
  #     host     = "172.16.28.100"
  #   }
  #   inline = [
  #     "echo 'test' > /tmp/test.txt"
  #   ]
  # }
  # provisioner "file" {
  #   source      = "packer/pfSense/http/config-pfSense-u-01.xml"
  #   destination = "/conf/config.xml"
  #   connection {
  #     type     = "ssh"
  #     user     = var.pfSense_credentials_vesxi-u-01.user
  #     password = var.pfSense_credentials_vesxi-u-01.password
  #     host     = "172.16.28.100"
  #   }
  # }
}


resource "vsphere_virtual_machine" "pfSense_vm_vesxi-u-02" {
  count            = var.pfSense_vm_desired_capacity_vesxi-u-02
  name             = "${var.pfSense_base_hostname_vesxi-u-02}${count.index + 1}"
  num_cpus         = var.pfSense_vm_params_vesxi-u-02["vcpu"]
  memory           = var.pfSense_vm_params_vesxi-u-02["ram"]
  datastore_id     = data.vsphere_datastore.pfSense-vesxi-u-02.id
  host_system_id   = data.vsphere_host.vesxi-u-02.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-u-02.id
  guest_id         = data.vsphere_virtual_machine.template_pfSense-u-02.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_pfSense-u-02.scsi_type
  # wait_for_guest_net_routable = false
  # wait_for_guest_ip_timeout = 0
  wait_for_guest_net_timeout = 0

  # Configure network interface
  network_interface {
    # network_id = data.vsphere_network.vesxi-u-02-pg-0.id
    network_id = data.vsphere_network.pfSense-vesxi-u-02-out.id
    use_static_mac = true
    mac_address = "1a:1a:1a:00:01:01"
  }

  network_interface {
    # network_id = data.vsphere_network.pfSense-vesxi-u-02.id
    network_id = data.vsphere_network.pfSense-vesxi-u-02-in.id
  }
  
  
  disk {
    name = "${var.pfSense_base_hostname_vesxi-u-02}${count.index + 1}.vmdk"
    size = var.pfSense_vm_params_vesxi-u-02["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_pfSense-u-02.id

  }
  # depends_on = [vsphere_host_port_group.pfSense_port-vesxi-u-02]
  depends_on = [data.vsphere_network.pfSense-vesxi-u-02-out, data.vsphere_network.pfSense-vesxi-u-02-in]

}


resource "vsphere_virtual_machine" "pfSense_vm_vesxi-r-03" {
  count            = var.pfSense_vm_desired_capacity_vesxi-r-03
  name             = "${var.pfSense_base_hostname_vesxi-r-03}${count.index + 1}"
  num_cpus         = var.pfSense_vm_params_vesxi-r-03["vcpu"]
  memory           = var.pfSense_vm_params_vesxi-r-03["ram"]
  datastore_id     = data.vsphere_datastore.pfSense-vesxi-r-03.id
  host_system_id   = data.vsphere_host.vesxi-r-03.id
  resource_pool_id = data.vsphere_resource_pool.vesxi-r-03.id
  guest_id         = data.vsphere_virtual_machine.template_pfSense-r-03.guest_id
  scsi_type        = data.vsphere_virtual_machine.template_pfSense-r-03.scsi_type
  # wait_for_guest_net_routable = false
  # wait_for_guest_ip_timeout = 0
  wait_for_guest_net_timeout = 0


  # Configure network interface
  network_interface {
    # network_id = data.vsphere_network.vesxi-r-03-pg-0.id
    network_id = data.vsphere_network.pfSense-vesxi-r-03-out.id
    use_static_mac = true
    mac_address = "1a:1a:1a:00:02:01"
  }

  network_interface {
    # network_id = data.vsphere_network.pfSense-vesxi-r-03.id
    network_id = data.vsphere_network.pfSense-vesxi-r-03-in.id
  }
  
  
  disk {
    name = "${var.pfSense_base_hostname_vesxi-r-03}${count.index + 1}.vmdk"
    size = var.pfSense_vm_params_vesxi-r-03["disk_size"]
  }

  # Define template and customisation params
  clone {
    template_uuid = data.vsphere_virtual_machine.template_pfSense-r-03.id

  }
  # depends_on = [vsphere_host_port_group.pfSense_port-vesxi-r-03]
  depends_on = [data.vsphere_network.pfSense-vesxi-r-03-out, data.vsphere_network.pfSense-vesxi-r-03-in]

}


