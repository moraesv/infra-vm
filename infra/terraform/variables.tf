variable "region" {
  type        = string
  description = "Região da Magalu Cloud"
  default     = "br-se1"
}

variable "api_key" {
  type      = string
  sensitive = true
}

variable "api_secret_key" {
  type      = string
  sensitive = true
}

variable "vm_name" {
  type    = string
  default = "infra-vm"
}

variable "machine_type" {
  type    = string
  default = "BV4-8-20"
}

variable "image_name" {
  type    = string
  default = "cloud-ubuntu-24.04 LTS"
}

variable "ssh_user" {
  type    = string
  default = "user-infra-vm"
}
variable "ssh_pub_key_file" {
  type    = string
  default = "infra-vm-key.pub"
}

variable "vpc_id" {
  description = "ID da VPC existente"
  type        = string
}
