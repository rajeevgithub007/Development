provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      hashicorp-learn = "module-use"
    }
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
#  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
#data "aws_ami" "latest_amazon_linux" {
#  most_recent = true
#
#  owners      = ["amazon"]
#  filters = {
#    name                 = "amzn2-ami-hvm-*-x86_64-gp2"
#    root-device-type     = "ebs"
#    virtualization-type = "hvm"
#  }
#}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "tenantowner-demo-instance"
#  ami = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
#  key_name               = "user1"
  monitoring             = false
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}