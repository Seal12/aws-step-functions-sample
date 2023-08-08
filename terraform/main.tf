provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_credential_profile}"
}

provider "archive" {}

terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
