# Create load balancer

resource "aws_alb" "two-tier-alb" {
  name = "two-tier-alb"
  internal = "false"
  load_balancer_type = "application"
  security_groups = [aws_security_group.bastion_sg.id]
  subnets = [ aws_subnet.two-tier-pub-sub-1.id, aws_subnet.two-tier-pub-sub-2.id ]
  enable_deletion_protection = "false"
  ip_address_type = "ipv4"

  tags = {
    Name = "two-tier-alb"
  }
}

# create target group

resource "aws_alb_target_group" "two-tier-alb-tg" {
  name = "two-tier-alb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.two-tier-vpc.id
  ip_address_type = "ipv4"
  health_check {
    protocol = "HTTP"
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
}

# create load balance listener

resource "aws_alb_listener" "two-tier-alb-listener" {
  load_balancer_arn = aws_alb.two-tier-alb.id
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.two-tier-alb-tg.id
  }
  
}

resource "aws_alb_target_group_attachment" "two-tier-tg-attch-1" {
  target_group_arn = aws_alb_target_group.two-tier-alb-tg.arn
  target_id = aws_instance.server.id
  port = 80
}

