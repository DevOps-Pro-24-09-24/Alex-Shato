packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "instance_size" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "base_ami" {
  type    = string
  default = "ami-12345678"
}

source "amazon-ebs" "db" {
  ami_name      = "my-db-ami"
  instance_type = var.instance_size
  region        = var.region
  source_ami    = var.base_ami
  ssh_username  = "ubuntu"

  tags = {
    "Name"        = "my-db-instance"
    "Environment" = "Test"
    "Project"     = "FlaskApp"
  }
}

build {
  name    = "db-build"
  sources = ["source.amazon-ebs.db"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y mariadb-server",
      "sudo systemctl enable --now mariadb.service",
      "sudo mysql -e \"CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'Pa55WD';\"",
      "sudo mysql -e \"CREATE DATABASE flask_db;\"",
      "sudo mysql -e \"GRANT ALL PRIVILEGES ON flask_db.* TO 'admin'@'%';\"",
      "sudo mysql -e \"FLUSH PRIVILEGES;\"",
      "sudo sed -i 's/^bind-address\\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf",
      "sudo systemctl restart mysql"
    ]
  }
}
