resource "mgc_virtual_machine_instances" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  image        = var.image_name
  ssh_key_name = mgc_ssh_keys.my_key.name

  # lifecycle {
  #   prevent_destroy = true
  # }
}
