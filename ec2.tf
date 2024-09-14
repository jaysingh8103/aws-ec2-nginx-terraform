resource "aws_instance" "nginx-server" {
  ami                         = "ami-0522ab6e1ddcc7055"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx_security_group.id]
  associate_public_ip_address = true

  user_data = <<-EOF
      #!/bin/bash
      sudo apt update -y
      sudo apt install nginx -y
      sudo systemctl start nginx
      sudo systemctl enable nginx
      EOF

  tags = {
    Name = "nginx-server"
  }
}
