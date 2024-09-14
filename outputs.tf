output "nginx_server_public_ip" {
    description = "The public IP of the NGINX server"
    value       = aws_instance.nginx-server.public_ip
}

output "instance_url" {
    description = "the url is"
    value = "http://${aws_instance.nginx-server.public_ip}"
  
}