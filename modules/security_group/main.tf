
resource "random_id" "name" {
  byte_length = 4
}
# create security group for load balancer
resource "aws_security_group" "elb_sg" {
    name        = "${var.project_name}-sg-${random_id.name.hex}"
    description = "Security group for HTTPS and HTTP traffic"
    vpc_id      = var.vpc_id
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


    # security group for client to access     

resource "aws_security_group" "client_sg" {
    name        = "${var.project_name}-client-sg"
    description = "Security group for client to access"
    vpc_id      = var.vpc_id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  
}

ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


# create sg for database access

resource "aws_security_group" "db_sg" {
    name        = "${var.project_name}-db-sg"
    description = "Security group for database access"
    vpc_id      = var.vpc_id
    
    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        security_groups = [aws_security_group.client_sg.id]
  
}

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}    