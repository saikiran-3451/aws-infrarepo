# DB subnet group: groups the private subnet for the RDS instance.
resource "aws_db_subnet_group" "main" {
  name       = "${local.name_prefix}-db-subnet-group"
  subnet_ids = [aws_subnet.private.id]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-db-subnet-group"
    }
  )
}

# RDS MySQL instance: provides a managed private database for the application tier.
resource "aws_db_instance" "main" {
  identifier              = "${local.name_prefix}-mysql"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  allocated_storage       = 20
  storage_type            = "gp3"
  storage_encrypted       = true
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds.id]
  publicly_accessible     = false
  multi_az                = false
  skip_final_snapshot     = var.skip_final_snapshot
  backup_retention_period = 7
  apply_immediately       = true
  deletion_protection     = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-mysql"
      Type = "database"
    }
  )
}
