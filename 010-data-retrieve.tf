#### GLOBAL CONFIG DC AND HOST
# Define datacenter
data "vsphere_datacenter" "dc" {
  name = var.dc
}

# Hosts config retrieve
data "vsphere_host" "vesxi-u-01" {
  name          = var.clusters.vesxi-u-01
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "vesxi-u-02" {
  name          = var.clusters.vesxi-u-02
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "vesxi-r-03" {
  name          = var.clusters.vesxi-r-03
  datacenter_id = data.vsphere_datacenter.dc.id
}



# Ressource pools config retrieve
data "vsphere_resource_pool" "vesxi-u-01" {
  # If you haven't resource pool, put "Resources" after cluster name
  name          = "${var.clusters.vesxi-u-01}/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "vesxi-u-02" {
  # If you haven't resource pool, put "Resources" after cluster name
  name          = "${var.clusters.vesxi-u-02}/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_resource_pool" "vesxi-r-03" {
  # If you haven't resource pool, put "Resources" after cluster name
  name          = "${var.clusters.vesxi-r-03}/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}


# DataStore config retrieve
data "vsphere_datastore" "ubuntu-vesxi-u-01" {
  name          = var.ubuntu_vm_params_vesxi-u-01["disk_datastore"]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "ubuntu-vesxi-u-02" {
  name          = var.ubuntu_vm_params_vesxi-u-02["disk_datastore"]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "ubuntu-vesxi-r-03" {
  name          = var.ubuntu_vm_params_vesxi-r-03["disk_datastore"]
  datacenter_id = data.vsphere_datacenter.dc.id
}


# # Retrieve datastore information on vsphere
# data "vsphere_datastore" "datastore_db" {
#   name          = var.db_vm_params["disk_datastore"]
#   datacenter_id = data.vsphere_datacenter.dc.id
# }



# Port groups config retrieve
data "vsphere_network" "vesxi-u-01-pg-0" {
  name          = var.port_groups.vesxi-u-01-pg-0
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vesxi-u-02-pg-0" {
  name          = var.port_groups.vesxi-u-02-pg-0
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vesxi-r-03-pg-0" {
  name          = var.port_groups.vesxi-r-03-pg-0
  datacenter_id = data.vsphere_datacenter.dc.id
}

## -> Move to 020-network.tf due to issue: timming dependecy; should be ok but is not
# vSwitches config retrieve
data "vsphere_network" "ubuntu-vesxi-u-01" {
  name          = var.ubuntu_network_params_vesxi-u-01["label"]
  datacenter_id = data.vsphere_datacenter.dc.id
  depends_on    = [vsphere_host_port_group.ubuntu_port-vesxi-u-01]
}

data "vsphere_network" "ubuntu-vesxi-u-02" {
  name          = var.ubuntu_network_params_vesxi-u-02["label"]
  datacenter_id = data.vsphere_datacenter.dc.id
  depends_on    = [vsphere_host_port_group.ubuntu_port-vesxi-u-02]
}

data "vsphere_network" "ubuntu-vesxi-r-03" {
  name          = var.ubuntu_network_params_vesxi-r-03["label"]
  datacenter_id = data.vsphere_datacenter.dc.id
  depends_on    = [vsphere_host_port_group.ubuntu_port-vesxi-r-03]
}

# pfSense vSxitches
data "vsphere_network" "pfSense-vesxi-u-01-out" {
  name          = join("", [var.pfSense_network_params_vesxi-u-01["label"], "-out"])
  datacenter_id = data.vsphere_datacenter.dc.id
  # depends_on    = [vsphere_host_port_group.pfSense_port-vesxi-u-01-out]
}

data "vsphere_network" "pfSense-vesxi-u-01-in" {
  name          = join("", [var.pfSense_network_params_vesxi-u-01["label"], "-in"])
  datacenter_id = data.vsphere_datacenter.dc.id
  # depends_on    = [vsphere_host_port_group.pfSense_port-vesxi-u-01-in]
}

data "vsphere_network" "pfSense-vesxi-u-02-out" {
  name          = join("", [var.pfSense_network_params_vesxi-u-02["label"], "-out"])
  datacenter_id = data.vsphere_datacenter.dc.id
  # depends_on    = [vsphere_host_port_group.pfSense_port-vesxi-u-02-out]
}

data "vsphere_network" "pfSense-vesxi-u-02-in" {
  name          = join("", [var.pfSense_network_params_vesxi-u-02["label"], "-in"])
  datacenter_id = data.vsphere_datacenter.dc.id
  # depends_on    = [vsphere_host_port_group.pfSense_port-vesxi-u-02-in]
}

data "vsphere_network" "pfSense-vesxi-r-03-out" {
  name          = join("", [var.pfSense_network_params_vesxi-r-03["label"], "-out"])
  datacenter_id = data.vsphere_datacenter.dc.id
  # depends_on    = [vsphere_host_port_group.pfSense_port-vesxi-r-03-in]
}

data "vsphere_network" "pfSense-vesxi-r-03-in" {
  name          = join("", [var.pfSense_network_params_vesxi-r-03["label"], "-in"])
  datacenter_id = data.vsphere_datacenter.dc.id
  # depends_on    = [vsphere_host_port_group.pfSense_port-vesxi-r-03-out]
}





# Retrieve template information on vsphere
data "vsphere_virtual_machine" "template_ubuntu_18_04" {
  name          = var.template_image_ubuntu_18_04
  datacenter_id = data.vsphere_datacenter.dc.id
}


# data "vsphere_virtual_machine" "template_pfSense" {
#   name          = var.template_image_pfSense
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

