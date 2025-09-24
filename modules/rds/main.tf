

resource "aws_db_subnet_group" "db-subnet" {
  name       = "${var.project_name}-sub-grp"
  subnet_ids = [var.private_subnet_2_id, var.private_subnet_4_id] # Replace with your private subnet IDs
}

resource "aws_db_instance" "db" {
  identifier              = "${var.project_name}-instance"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  db_name                 = "antiquecafedb"
  multi_az                = true
  storage_type            = "gp2"
  storage_encrypted       = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 0

  vpc_security_group_ids = [var.db_sg_id] # Replace with your desired security group ID

  db_subnet_group_name = aws_db_subnet_group.db-subnet.name

  tags = {
    Name = "${var.project_name}db"
  }
}