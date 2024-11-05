# ec2 instance

resource "aws_instance" "server" {
  ami = "ami-0eaf7c3456e7b5b68"
  subnet_id = aws_subnet.two-tier-pub-sub-1.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.bastion_sg.id ]
  key_name = "demo"

tags = {
  Name = "app-instance"
 }

   user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}

