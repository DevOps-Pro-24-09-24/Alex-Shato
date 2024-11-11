# Input variables

# AWS region
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

# AMI ID
variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-0eddb4a4e7d846d6f"
}

# Instance type
variable "instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t2.micro"
}

# VPC CIDR block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/24"
}

# Public subnet CIDR block
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "192.168.0.0/25"
}

# Private subnet CIDR block
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "192.168.0.128/25"
}

# Allowed SSH IP
variable "allowed_ssh_ip" {
  description = "IP address allowed for SSH access"
  type        = string
  default     = "93.170.44.28/32"
}

# Key name for SSH
variable "key_name" {
  description = "Name of the SSH key"
  type        = string
  default     = "web-key"
}
