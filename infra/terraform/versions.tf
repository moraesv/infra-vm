terraform {
  required_version = ">= 1.7.0"
  required_providers {
    mgc = {
      source  = "MagaluCloud/mgc"
      version = "~> 0.35.0"
    }
  }

  backend "s3" {
    bucket                      = "terraform-state-moraesv"
    key                         = "user-infra-vm/terraform.tfstate"
    region                      = "br-se1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
