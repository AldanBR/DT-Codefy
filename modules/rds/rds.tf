resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "desafio-db"
  username = var.db_username
  password = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  vpc_security_group_ids = [var.security_group]

  tags = {
    Name = "Desafio-RDS"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "desafio-rds-subnet-group"

  subnet_ids = var.private_subnets

  tags = {
    Name = "Desafio-RDS-Subnet-Group"
  }
}