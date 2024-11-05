# create output file

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.server.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.server.public_ip
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.server.private_ip
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.bastion_sg.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.two-tier-pub-sub-1.id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.two-tier-vpc.id
}
