provider "aws" {
  region = var.region

  default_tags {
    tags = {
      "Source"      = "Terraform"
      "Environment" = "Sandbox"
    }
  }
}