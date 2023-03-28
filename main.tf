/***
terraform init: obter os plugins de comunicação com o provider
executa a lógica contida no bloco terraform {}

*/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = "iac-alura"
  # user_data = <<-EOF
  #   #!/bin/bash
  #   cd /home/ubuntu
  #   echo "<h1>Olá, Terraform! :D</h1>" > index.html
  #   nohup busybox httpd -f -p 8080 &
  # EOF
  tags = {
    Name = "Teste AWS"
  }
}

# ansible-playbook playbook.yml -u ubuntu --private-key iac-alura.pem -i 