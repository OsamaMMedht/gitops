resource "aws_db_instance" "postgres" {
  identifier              = var.name
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  username                = var.username
  password                = var.password
  db_name                 = var.db_name
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = "gp2"
  vpc_security_group_ids  = var.security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.db_subnet.name
  skip_final_snapshot     = true
  publicly_accessible     = var.publicly_accessible
  multi_az                = var.multi_az

  tags = {
    Name = var.name
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnet-group"
  }
}