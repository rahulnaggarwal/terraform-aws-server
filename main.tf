variable ami {}
variable subnet_id {}
variable vpc_security_group_ids {
  type = list
}
variable identity {}
variable web_count {}

resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  count                  = var.web_count

  tags = {
    "Identity"    = var.identity
    "Name"        = "Student"
    "Environment" = "Training"
  }
}

output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "public_dns" {
  value = aws_instance.web.*.public_dns
}
Commit the changes into GitHub.

Update github repository
Back in your ptfe-workspace repository created earlier.

Add a new folder called app-web-modules/.

Create a single main.tf file with the following contents:

provider "aws" {
}

module "server" {
  source = "gov.tfe.rocks/YOUR_ORG_NAME/server/aws"

  ami                    = var.ami
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  identity               = var.identity
  web_count              = var.web_count
}
