resource "aws_db_instance" "default" {
  engine                 = "mysql"
  engine_version         = "5.7.34"
  identifier             = "phonebook-db"
  username               = "dbadmin"
  password               = "u6QibHhani"
  instance_class         = "db.t2.micro"
  storage_type           = "gp2"
  allocated_storage      = 20
  vpc_security_group_ids = [
    var.security_group_db,
  ]
  db_name              = "phonebook"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}