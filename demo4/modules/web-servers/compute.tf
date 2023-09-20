resource "aws_instance" "instance_1" {
  ami             = var.ami
  subnet_id       = var.subnets[0]
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.instances.id]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_2" {
  ami             = var.ami
  subnet_id       = var.subnets[0]
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.instances.id]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 2" > index.html
              python3 -m http.server 8080 &
              EOF
}