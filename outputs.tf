output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.ec2_instance[*].public_ip
}
#output "latest_amazon_linux_ami_id" {
#  value = data.aws_ami.latest_amazon_linux.id
#}