terraform {
  required_version = ">= 0.14.1"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45.0"
    }
  }
}
