resource "aws_elb" "clb" {
  name               = "${var.project_name}-clb"
  security_groups    = [var.elb_sg_id]
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id]
  idle_timeout        = 60

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-clb"
  }
}
