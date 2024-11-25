packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "instance_size" {
  type = string
}

variable "region" {
  type = string
}

variable "base_ami" {
  type = string
}

source "amazon-ebs" "app" {
  ami_name      = "my-app-ami"
  instance_type = var.instance_size
  region        = var.region
  source_ami    = var.base_ami
  ssh_username  = "ubuntu"

  tags = {
    "Name"        = "my-app-instance"
    "Environment" = "Test"
    "Project"     = "FlaskApp"
  }
}

build {
  name    = "app-build"
  sources = ["source.amazon-ebs.app"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python3-pip default-libmysqlclient-dev build-essential pkg-config python3-venv",
      "git clone https://github.com/saaverdo/flask-alb-app -b orm",
      "cd flask-alb-app",
      "python3 -m venv venv",
      ". venv/bin/activate",
      "sudo bash -c 'echo \"export MYSQL_USER=admin\" >> /etc/profile.d/mysql_env.sh'",
      "sudo bash -c 'echo \"export MYSQL_PASSWORD=Pa55WD\" >> /etc/profile.d/mysql_env.sh'",
      "sudo bash -c 'echo \"export MYSQL_DB=flask_db\" >> /etc/profile.d/mysql_env.sh'",
      "sudo bash -c 'echo \"export MYSQL_HOST=\" >> /etc/profile.d/mysql_env.sh'",
      "sudo bash -c 'echo \"export FLASK_CONFIG=mysql\" >> /etc/profile.d/mysql_env.sh'",
      "sudo chmod +x /etc/profile.d/mysql_env.sh",
      ". /etc/profile.d/mysql_env.sh",
      "pip install -r requirements.txt",
    ]
  }
}
