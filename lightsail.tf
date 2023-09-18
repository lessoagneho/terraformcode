resource "aws_lightsail_instance" "example" {
  name              = "example-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon-linux-2-latest"
  bundle_id         = "micro_2_0"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo bash -c 'echo "<h1>This Server is created using Terraform </h1>" > /var/www/html/index.html'
              EOF
}