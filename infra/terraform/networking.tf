resource "mgc_ssh_keys" "my_key" {
  name = var.ssh_user
  key  = file(var.ssh_pub_key_file)
}

resource "mgc_network_security_groups" "security" {
  name        = "${var.vm_name}-sg"
  description = "MGC Network Security Group for ${var.vm_name}"
}

resource "mgc_network_public_ips" "vm_public_ip" {
  description = "${var.vm_name} public IP"
  vpc_id      = var.vpc_id
}

locals {
  primary_interface_id = [
    for interface in mgc_virtual_machine_instances.vm.network_interfaces :
    interface.id if interface.primary
  ][0]
}

resource "mgc_network_security_groups_attach" "sg_attachment" {
  security_group_id = mgc_network_security_groups.security.id
  interface_id      = local.primary_interface_id
}

resource "mgc_network_public_ips_attach" "ip_attachment" {
  public_ip_id = mgc_network_public_ips.vm_public_ip.id
  interface_id = local.primary_interface_id
}

resource "mgc_network_security_groups_rules" "allow_ingress_ssh" {
  depends_on        = [mgc_network_security_groups.security]
  description       = "Ingress"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 22
  port_range_max    = 22
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.security.id
}

resource "mgc_network_security_groups_rules" "allow_ingress_app" {
  depends_on        = [mgc_network_security_groups.security]
  description       = "Ingress"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 8000
  port_range_max    = 8000
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.security.id
}


resource "mgc_network_security_groups_rules" "allow_ingress_http" {
  depends_on        = [mgc_network_security_groups.security]
  description       = "Ingress"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 80
  port_range_max    = 80
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.security.id
}

resource "mgc_network_security_groups_rules" "allow_ingress_https" {
  depends_on        = [mgc_network_security_groups.security]
  description       = "Ingress"
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 443
  port_range_max    = 443
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = mgc_network_security_groups.security.id
}
