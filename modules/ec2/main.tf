resource "aws_instance" "ec2" {
  ami                    = "ami-0a874daec5f3f65de"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.security_group_http]
  tags                   = {
    Name = "Webserver"
  }
}