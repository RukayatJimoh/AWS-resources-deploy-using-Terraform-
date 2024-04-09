resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  identifier           = var.db_identifier
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible = true

}