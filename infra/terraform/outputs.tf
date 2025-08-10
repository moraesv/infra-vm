output "vm_ip" {
  description = "IP público da VM"
  value       = mgc_network_public_ips.vm_public_ip.public_ip
}

output "vm_name" {
  description = "Nome da instância"
  value       = mgc_virtual_machine_instances.vm.name
}
