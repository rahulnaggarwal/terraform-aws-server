provider "aws" {
}

module "server" {
  source = "gov.tfe.rocks/rra241-org/server/aws"

  ami                    = var.ami
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  identity               = var.identity
  web_count              = var.web_count
}
