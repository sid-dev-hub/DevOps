
provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA5Q5XI3WP5QHBBDLF"
  secret_key = "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"
}

resource "aws_instance" "JenkinsServe" {
  instance_type = "t2.micro"
  availability_zone = "ap-south-1b"
  ami = "ami-025b4b7b37b743227"

  user_data = <<-EOF
        #!/bin/bash
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo bash -c "echo This is created using Terraform > /var/www/html/index.html"
        EOF

  tags = {
    Name = "JenkinsEC"
  }
}

resource "aws_instance" "WebServe" {
  instance_type = "t2.micro"
  availability_zone = "ap-south-1b"
  ami = "ami-025b4b7b37b743227"

  user_data = <<-EOF
        #!/bin/bash
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo bash -c "echo This is created using Terraform > /var/www/html/index.html"
        EOF

  tags = {
    Name = "WebEC"
  }
}

