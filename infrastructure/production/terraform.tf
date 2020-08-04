terraform {
  backend "s3" {
    bucket  = "infrastructure.somleng.org"
    key     = "somleng_adhearsion.tfstate"
    encrypt = true
    region  = "ap-southeast-1"
  }
}

provider "aws" {
  region = var.aws_region
}

data "terraform_remote_state" "core" {
  backend = "s3"

  config = {
    bucket = "infrastructure.somleng.org"
    key    = "somleng_adhearsion_core.tfstate"
    region = var.aws_region
  }
}

data "terraform_remote_state" "core_infrastructure" {
  backend = "s3"

  config = {
    bucket = "infrastructure.somleng.org"
    key    = "core.tfstate"
    region = var.aws_region
  }
}
