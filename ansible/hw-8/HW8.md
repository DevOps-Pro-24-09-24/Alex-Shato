### Create app-image:
```bash
packer build -var-file=variables.pkrvars.hcl app_template_var.pkr.hcl 
...
==> Builds finished. The artifacts of successful builds are:
--> app-image.amazon-ebs.app: AMIs were created:
eu-central-1: ami-0f9edb0cc721e4fcb
```
<details>

```bash
app-image.amazon-ebs.app: output will be in this color.

==> app-image.amazon-ebs.app: Prevalidating any provided VPC information
==> app-image.amazon-ebs.app: Prevalidating AMI Name: app-ami-ansible
    app-image.amazon-ebs.app: Found Image ID: ami-0084a47cc718c111a
==> app-image.amazon-ebs.app: Creating temporary keypair: packer_67593c32-9c44-87fc-faa9-a18e361bd92e
==> app-image.amazon-ebs.app: Creating temporary security group for this instance: packer_67593c35-5773-d7e8-d423-53dc7ffd5144
==> app-image.amazon-ebs.app: Authorizing access to port 22 from [0.0.0.0/0] in the temporary security groups...
==> app-image.amazon-ebs.app: Launching a source AWS instance...
    app-image.amazon-ebs.app: Instance ID: i-0248384824894ec48
==> app-image.amazon-ebs.app: Waiting for instance (i-0248384824894ec48) to become ready...
==> app-image.amazon-ebs.app: Using SSH communicator to connect: 63.176.162.118
==> app-image.amazon-ebs.app: Waiting for SSH to become available...
==> app-image.amazon-ebs.app: Connected to SSH!
==> app-image.amazon-ebs.app: Provisioning with Ansible...
    app-image.amazon-ebs.app: Setting up proxy adapter for Ansible....
==> app-image.amazon-ebs.app: Executing Ansible: ansible-playbook -e packer_build_name="app" -e packer_builder_type=amazon-ebs --ssh-extra-args '-o IdentitiesOnly=yes' -e ansible_ssh_private_key_file=/tmp/ansible-key3840152769 -i /tmp/packer-provisioner-ansible963570626 /root/hillel/ansible/hw-8/try1/ansible/app_install.yml
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: PLAY [Install application dependencies] ****************************************
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Gathering Facts] *********************************************************
    app-image.amazon-ebs.app: [WARNING]: Platform linux on host default is using the discovered Python
    app-image.amazon-ebs.app: interpreter at /usr/bin/python3.12, but future installation of another Python
    app-image.amazon-ebs.app: interpreter could change the meaning of that path. See
    app-image.amazon-ebs.app: ok: [default]
    app-image.amazon-ebs.app: https://docs.ansible.com/ansible-
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: core/2.17/reference_appendices/interpreter_discovery.html for more information.
    app-image.amazon-ebs.app: TASK [Install required packages] ***********************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: PLAY RECAP *********************************************************************
    app-image.amazon-ebs.app: default                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
    app-image.amazon-ebs.app:
==> app-image.amazon-ebs.app: Provisioning with Ansible...
    app-image.amazon-ebs.app: Setting up proxy adapter for Ansible....
==> app-image.amazon-ebs.app: Executing Ansible: ansible-playbook -e packer_build_name="app" -e packer_builder_type=amazon-ebs --ssh-extra-args '-o IdentitiesOnly=yes' --extra-vars repo=https://github.com/saaverdo/flask-alb-app dir=/opt/app -e ansible_ssh_private_key_file=/tmp/ansible-key3874321467 -i /tmp/packer-provisioner-ansible1938467294 /root/hillel/ansible/hw-8/try1/ansible/deploy.yml
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: PLAY [Deploy application] ******************************************************
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Gathering Facts] *********************************************************
    app-image.amazon-ebs.app: [WARNING]: Platform linux on host default is using the discovered Python
    app-image.amazon-ebs.app: interpreter at /usr/bin/python3.12, but future installation of another Python
    app-image.amazon-ebs.app: interpreter could change the meaning of that path. See
    app-image.amazon-ebs.app: https://docs.ansible.com/ansible-
    app-image.amazon-ebs.app: ok: [default]
    app-image.amazon-ebs.app: core/2.17/reference_appendices/interpreter_discovery.html for more information.
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Update apt packages] *****************************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Upgrade all packages] ****************************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Clone the application repository] ****************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Create Python virtual environment] ***************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Activate virtual environment and install dependencies] *******************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Set MySQL environment variables] *****************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Configure systemd service for the app] ***********************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: TASK [Start and enable the app service] ****************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: RUNNING HANDLER [Restart app service] ******************************************
    app-image.amazon-ebs.app: changed: [default]
    app-image.amazon-ebs.app:
    app-image.amazon-ebs.app: PLAY RECAP *********************************************************************
    app-image.amazon-ebs.app: default                    : ok=10   changed=9    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
    app-image.amazon-ebs.app:
==> app-image.amazon-ebs.app: Stopping the source instance...
    app-image.amazon-ebs.app: Stopping instance
==> app-image.amazon-ebs.app: Waiting for the instance to stop...
==> app-image.amazon-ebs.app: Creating AMI app-ami-ansible from instance i-0248384824894ec48
    app-image.amazon-ebs.app: AMI: ami-0f9edb0cc721e4fcb
==> app-image.amazon-ebs.app: Waiting for AMI to become ready...
==> app-image.amazon-ebs.app: Skipping Enable AMI deprecation...
==> app-image.amazon-ebs.app: Terminating the source AWS instance...
==> app-image.amazon-ebs.app: Cleaning up any extra volumes...
==> app-image.amazon-ebs.app: No volumes to clean up, skipping
==> app-image.amazon-ebs.app: Deleting temporary security group...
==> app-image.amazon-ebs.app: Deleting temporary keypair...
Build 'app-image.amazon-ebs.app' finished after 7 minutes 26 seconds.

==> Wait completed after 7 minutes 26 seconds

==> Builds finished. The artifacts of successful builds are:
--> app-image.amazon-ebs.app: AMIs were created:
eu-central-1: ami-0f9edb0cc721e4fcb
```
</details>

### Create db-image:
```bash
packer build -var-file=variables.pkrvars.hcl db_template_var.pkr.hcl 
...
==> Builds finished. The artifacts of successful builds are:
--> db-image.amazon-ebs.db: AMIs were created:
eu-central-1: ami-0197eff7261be9d80
```
<details>

```bash
db-image.amazon-ebs.db: output will be in this color.

==> db-image.amazon-ebs.db: Prevalidating any provided VPC information
==> db-image.amazon-ebs.db: Prevalidating AMI Name: db-ami-ansible
    db-image.amazon-ebs.db: Found Image ID: ami-0084a47cc718c111a
==> db-image.amazon-ebs.db: Creating temporary keypair: packer_67593e60-f47d-ef85-5af8-836c0bea3341
==> db-image.amazon-ebs.db: Creating temporary security group for this instance: packer_67593e62-f9dd-2583-29c9-f5af2d23d127
==> db-image.amazon-ebs.db: Authorizing access to port 22 from [0.0.0.0/0] in the temporary security groups...
==> db-image.amazon-ebs.db: Launching a source AWS instance...
    db-image.amazon-ebs.db: Instance ID: i-0bda68bfec048a972
==> db-image.amazon-ebs.db: Waiting for instance (i-0bda68bfec048a972) to become ready...
==> db-image.amazon-ebs.db: Using SSH communicator to connect: 3.122.193.229
==> db-image.amazon-ebs.db: Waiting for SSH to become available...
==> db-image.amazon-ebs.db: Connected to SSH!
==> db-image.amazon-ebs.db: Provisioning with Ansible...
    db-image.amazon-ebs.db: Setting up proxy adapter for Ansible....
==> db-image.amazon-ebs.db: Executing Ansible: ansible-playbook -e packer_build_name="db" -e packer_builder_type=amazon-ebs --ssh-extra-args '-o IdentitiesOnly=yes' --extra-vars mysql_user=admin mysql_pass=Pa55WD mysql_db=flask_db -e ansible_ssh_private_key_file=/tmp/ansible-key1122762282 -i /tmp/packer-provisioner-ansible1253231787 /root/hillel/ansible/hw-8/try1/ansible/db_install.yml
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: PLAY [Configure database server] ***********************************************
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: TASK [Gathering Facts] *********************************************************
    db-image.amazon-ebs.db: [WARNING]: Platform linux on host default is using the discovered Python
    db-image.amazon-ebs.db: interpreter at /usr/bin/python3.12, but future installation of another Python
    db-image.amazon-ebs.db: interpreter could change the meaning of that path. See
    db-image.amazon-ebs.db: https://docs.ansible.com/ansible-
    db-image.amazon-ebs.db: core/2.17/reference_appendices/interpreter_discovery.html for more information.
    db-image.amazon-ebs.db: ok: [default]
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: TASK [Install required packages] ***********************************************
    db-image.amazon-ebs.db: changed: [default]
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: TASK [Configure MySQL to listen on all interfaces] *****************************
    db-image.amazon-ebs.db: changed: [default]
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: TASK [Create MySQL database] ***************************************************
    db-image.amazon-ebs.db: changed: [default]
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: TASK [Create MySQL user] *******************************************************
    db-image.amazon-ebs.db: [WARNING]: Option column_case_sensitive is not provided. The default is now
    db-image.amazon-ebs.db: false, so the column's name will be uppercased. The default will be changed to
    db-image.amazon-ebs.db: true in community.mysql 4.0.0.
    db-image.amazon-ebs.db: changed: [default]
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: RUNNING HANDLER [Restart MySQL] ************************************************
    db-image.amazon-ebs.db: changed: [default]
    db-image.amazon-ebs.db:
    db-image.amazon-ebs.db: PLAY RECAP *********************************************************************
    db-image.amazon-ebs.db: default                    : ok=6    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
    db-image.amazon-ebs.db:
==> db-image.amazon-ebs.db: Stopping the source instance...
    db-image.amazon-ebs.db: Stopping instance
==> db-image.amazon-ebs.db: Waiting for the instance to stop...
==> db-image.amazon-ebs.db: Creating AMI db-ami-ansible from instance i-0bda68bfec048a972
    db-image.amazon-ebs.db: AMI: ami-0197eff7261be9d80
==> db-image.amazon-ebs.db: Waiting for AMI to become ready...
==> db-image.amazon-ebs.db: Skipping Enable AMI deprecation...
==> db-image.amazon-ebs.db: Terminating the source AWS instance...
==> db-image.amazon-ebs.db: Cleaning up any extra volumes...
==> db-image.amazon-ebs.db: No volumes to clean up, skipping
==> db-image.amazon-ebs.db: Deleting temporary security group...
==> db-image.amazon-ebs.db: Deleting temporary keypair...
Build 'db-image.amazon-ebs.db' finished after 3 minutes 37 seconds.

==> Wait completed after 3 minutes 37 seconds

==> Builds finished. The artifacts of successful builds are:
--> db-image.amazon-ebs.db: AMIs were created:
eu-central-1: ami-0197eff7261be9d80
```
</details>

### Substituting images into terraform:
```bash
grep ami variables.tf
variable "ami_id_web" {
  default     = "ami-0f9edb0cc721e4fcb"
variable "ami_id_db" {
  default     = "ami-0197eff7261be9d80"
```
<details>

```bash
cat variables.tf 

# Input variables

# AWS region
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

# AMI ID WEB
variable "ami_id_web" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-0f9edb0cc721e4fcb"
}

# AMI ID DB
variable "ami_id_db" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-0197eff7261be9d80"
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
  default     = "93.170.46.28/32"
}

# Key name for SSH
variable "key_name" {
  description = "Name of the SSH key"
  type        = string
  default     = "web-key"
}
```
</details>

### Create "app-instances" and "db-instances" using terraforms:
```bash
terraform apply 
...
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

db_instance_id = "i-0a01ae49ffd5d090c"
db_private_ip = "192.168.0.180"
web_instance_dns = "ec2-3-71-32-51.eu-central-1.compute.amazonaws.com"
web_instance_id = "i-0c10fbf4c97471fcf"
web_private_ip = "192.168.0.84"
web_public_ip = "3.71.32.51"
```
<details>

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.db will be created
  + resource "aws_instance" "db" {
      + ami                                  = "ami-0197eff7261be9d80"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "web-key"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "db-instance"
        }
      + tags_all                             = {
          + "Name" = "db-instance"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-0f9edb0cc721e4fcb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "web-key"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "web-instance"
        }
      + tags_all                             = {
          + "Name" = "web-instance"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "main-igw"
        }
      + tags_all = {
          + "Name" = "main-igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "public-route-table"
        }
      + tags_all         = {
          + "Name" = "public-route-table"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.public will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.sg_BACK will be created
  + resource "aws_security_group" "sg_BACK" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "sg-BACK"
        }
      + tags_all               = {
          + "Name" = "sg-BACK"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.sg_FRONT will be created
  + resource "aws_security_group" "sg_FRONT" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = -1
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "icmp"
              + security_groups  = []
              + self             = false
              + to_port          = -1
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 8000
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8000
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "93.170.46.28/32",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "sg-FRONT"
        }
      + tags_all               = {
          + "Name" = "sg-FRONT"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.private will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.0.128/25"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "private-subnet"
        }
      + tags_all                                       = {
          + "Name" = "private-subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.0.0/25"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "public-subnet"
        }
      + tags_all                                       = {
          + "Name" = "public-subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "192.168.0.0/24"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "main-vpc"
        }
      + tags_all                             = {
          + "Name" = "main-vpc"
        }
    }

Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + db_instance_id   = (known after apply)
  + db_private_ip    = (known after apply)
  + web_instance_dns = (known after apply)
  + web_instance_id  = (known after apply)
  + web_private_ip   = (known after apply)
  + web_public_ip    = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.main: Creating...
aws_vpc.main: Still creating... [10s elapsed]
aws_vpc.main: Creation complete after 12s [id=vpc-05a161abdc47edd5f]
aws_internet_gateway.igw: Creating...
aws_subnet.public: Creating...
aws_subnet.private: Creating...
aws_security_group.sg_FRONT: Creating...
aws_internet_gateway.igw: Creation complete after 1s [id=igw-025767855eb4b0476]
aws_route_table.public: Creating...
aws_subnet.private: Creation complete after 1s [id=subnet-041ea33b37941cf95]
aws_route_table.public: Creation complete after 1s [id=rtb-01e0e93c1da0c6451]
aws_security_group.sg_FRONT: Creation complete after 3s [id=sg-033381b5ece44d3a0]
aws_security_group.sg_BACK: Creating...
aws_security_group.sg_BACK: Creation complete after 2s [id=sg-0785559dbe73350ad]
aws_instance.db: Creating...
aws_subnet.public: Still creating... [10s elapsed]
aws_subnet.public: Creation complete after 12s [id=subnet-0bdb489f2e3139750]
aws_route_table_association.public: Creating...
aws_route_table_association.public: Creation complete after 0s [id=rtbassoc-0dd26542e5b1b68bf]
aws_instance.web: Creating...
aws_instance.db: Still creating... [10s elapsed]
aws_instance.db: Creation complete after 13s [id=i-0a01ae49ffd5d090c]
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Creation complete after 13s [id=i-0c10fbf4c97471fcf]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

db_instance_id = "i-0a01ae49ffd5d090c"
db_private_ip = "192.168.0.180"
web_instance_dns = "ec2-3-71-32-51.eu-central-1.compute.amazonaws.com"
web_instance_id = "i-0c10fbf4c97471fcf"
web_private_ip = "192.168.0.84"
web_public_ip = "3.71.32.51"
```
</details>

### Use ansible to specify the ip address db-instance in the app.service:

```bash
ansible-playbook -v -i ~/hillel/ansible/hw-8/try1/ansible/inventory.ini  ~/hillel/ansible/hw-8/try1/ansible/deploy_ip_db.yml --private-key=/root/.ssh/web-key.pem
...
PLAY RECAP ***********************************************************************************************************************************************************************************************
app_instance               : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
<details>

```bash
Using /root/hillel/ansible/hw-8/try1/ansible/ansible.cfg as config file

PLAY [Deploy ip db instance to app instance] *************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************
[WARNING]: Platform linux on host app_instance is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of that
path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [app_instance]

TASK [Set MySQL environment variables] *******************************************************************************************************************************************************************
changed: [app_instance] => {"changed": true, "cmd": "sudo sed -i 's/^export MYSQL_HOST=.*/export MYSQL_HOST=192.168.0.180/' /etc/profile.d/mysql_env.sh\nsource /etc/profile.d/mysql_env.sh\nsudo sed -i 's/Environment=\"MYSQL_HOST=\"$/Environment=\"MYSQL_HOST=192.168.0.180\"/' /etc/systemd/system/app.service\n", "delta": "0:00:00.028994", "end": "2024-12-11 09:16:04.144383", "msg": "", "rc": 0, "start": "2024-12-11 09:16:04.115389", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}

RUNNING HANDLER [Reload systemd] *************************************************************************************************************************************************************************
ok: [app_instance] => {"changed": false, "name": null, "status": {}}

RUNNING HANDLER [Restart app service] ********************************************************************************************************************************************************************
changed: [app_instance] => {"changed": true, "name": "app.service", "state": "started", "status": {"ActiveEnterTimestamp": "Wed 2024-12-11 09:13:10 UTC", "ActiveEnterTimestampMonotonic": "2817628066", "ActiveExitTimestamp": "Wed 2024-12-11 09:13:11 UTC", "ActiveExitTimestampMonotonic": "2818226401", "ActiveState": "failed", "After": "basic.target sysinit.target system.slice systemd-journald.socket -.mount network.target", "AllowIsolate": "no", "AssertResult": "yes", "AssertTimestamp": "Wed 2024-12-11 09:13:07 UTC", "AssertTimestampMonotonic": "2814670160", "Before": "shutdown.target multi-user.target", "BlockIOAccounting": "no", "BlockIOWeight": "[not set]", "CPUAccounting": "yes", "CPUAffinityFromNUMA": "no", "CPUQuotaPerSecUSec": "infinity", "CPUQuotaPeriodUSec": "infinity", "CPUSchedulingPolicy": "0", "CPUSchedulingPriority": "0", "CPUSchedulingResetOnFork": "no", "CPUShares": "[not set]", "CPUUsageNSec": "591149000", "CPUWeight": "[not set]", "CacheDirectoryMode": "0755", "CanFreeze": "yes", "CanIsolate": "no", "CanReload": "no", "CanStart": "yes", "CanStop": "yes", "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend cap_audit_read cap_perfmon cap_bpf cap_checkpoint_restore", "CleanResult": "success", "CollectMode": "inactive", "ConditionResult": "yes", "ConditionTimestamp": "Wed 2024-12-11 09:13:07 UTC", "ConditionTimestampMonotonic": "2814670157", "ConfigurationDirectoryMode": "0755", "Conflicts": "shutdown.target", "ControlGroupId": "0", "ControlPID": "0", "CoredumpFilter": "0x33", "CoredumpReceive": "no", "DefaultDependencies": "yes", "DefaultMemoryLow": "0", "DefaultMemoryMin": "0", "DefaultStartupMemoryLow": "0", "Delegate": "no", "Description": "App Service", "DevicePolicy": "auto", "DynamicUser": "no", "Environment": "MYSQL_USER=admin MYSQL_PASSWORD=Pa55WD MYSQL_DB=flask_db MYSQL_HOST=192.168.0.180 FLASK_CONFIG=mysql", "ExecMainCode": "1", "ExecMainExitTimestamp": "Wed 2024-12-11 09:13:11 UTC", "ExecMainExitTimestampMonotonic": "2818226236", "ExecMainPID": "3178", "ExecMainStartTimestamp": "Wed 2024-12-11 09:13:10 UTC", "ExecMainStartTimestampMonotonic": "2817627121", "ExecMainStatus": "3", "ExecStart": "{ path=/bin/bash ; argv[]=/bin/bash -c source /opt/app/venv/bin/activate && exec gunicorn -b 0.0.0.0 appy:app ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExecStartEx": "{ path=/bin/bash ; argv[]=/bin/bash -c source /opt/app/venv/bin/activate && exec gunicorn -b 0.0.0.0 appy:app ; flags= ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExitType": "main", "ExtensionImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent", "FailureAction": "none", "FileDescriptorStoreMax": "0", "FileDescriptorStorePreserve": "restart", "FinalKillSignal": "9", "FragmentPath": "/etc/systemd/system/app.service", "FreezerState": "running", "GID": "[not set]", "GuessMainPID": "yes", "IOAccounting": "no", "IOReadBytes": "[not set]", "IOReadOperations": "[not set]", "IOSchedulingClass": "2", "IOSchedulingPriority": "4", "IOWeight": "[not set]", "IOWriteBytes": "[not set]", "IOWriteOperations": "[not set]", "IPAccounting": "no", "IPEgressBytes": "[no data]", "IPEgressPackets": "[no data]", "IPIngressBytes": "[no data]", "IPIngressPackets": "[no data]", "Id": "app.service", "IgnoreOnIsolate": "no", "IgnoreSIGPIPE": "yes", "InactiveEnterTimestamp": "Wed 2024-12-11 09:13:11 UTC", "InactiveEnterTimestampMonotonic": "2818372118", "InactiveExitTimestamp": "Wed 2024-12-11 09:13:11 UTC", "InactiveExitTimestampMonotonic": "2818227331", "InvocationID": "f629e9313d354e58828fa443eb2e9a86", "JobRunningTimeoutUSec": "infinity", "JobTimeoutAction": "none", "JobTimeoutUSec": "infinity", "KeyringMode": "private", "KillMode": "control-group", "KillSignal": "15", "LimitAS": "infinity", "LimitASSoft": "infinity", "LimitCORE": "infinity", "LimitCORESoft": "0", "LimitCPU": "infinity", "LimitCPUSoft": "infinity", "LimitDATA": "infinity", "LimitDATASoft": "infinity", "LimitFSIZE": "infinity", "LimitFSIZESoft": "infinity", "LimitLOCKS": "infinity", "LimitLOCKSSoft": "infinity", "LimitMEMLOCK": "8388608", "LimitMEMLOCKSoft": "8388608", "LimitMSGQUEUE": "819200", "LimitMSGQUEUESoft": "819200", "LimitNICE": "0", "LimitNICESoft": "0", "LimitNOFILE": "524288", "LimitNOFILESoft": "1024", "LimitNPROC": "3769", "LimitNPROCSoft": "3769", "LimitRSS": "infinity", "LimitRSSSoft": "infinity", "LimitRTPRIO": "0", "LimitRTPRIOSoft": "0", "LimitRTTIME": "infinity", "LimitRTTIMESoft": "infinity", "LimitSIGPENDING": "3769", "LimitSIGPENDINGSoft": "3769", "LimitSTACK": "infinity", "LimitSTACKSoft": "8388608", "LoadState": "loaded", "LockPersonality": "no", "LogLevelMax": "-1", "LogRateLimitBurst": "0", "LogRateLimitIntervalUSec": "0", "LogsDirectoryMode": "0755", "MainPID": "0", "ManagedOOMMemoryPressure": "auto", "ManagedOOMMemoryPressureLimit": "0", "ManagedOOMPreference": "none", "ManagedOOMSwap": "auto", "MemoryAccounting": "yes", "MemoryAvailable": "644284416", "MemoryCurrent": "[not set]", "MemoryDenyWriteExecute": "no", "MemoryHigh": "infinity", "MemoryKSM": "no", "MemoryLimit": "infinity", "MemoryLow": "0", "MemoryMax": "infinity", "MemoryMin": "0", "MemoryPeak": "[not set]", "MemoryPressureThresholdUSec": "200ms", "MemoryPressureWatch": "auto", "MemorySwapCurrent": "[not set]", "MemorySwapMax": "infinity", "MemorySwapPeak": "[not set]", "MemoryZSwapCurrent": "[not set]", "MemoryZSwapMax": "infinity", "MountAPIVFS": "no", "MountImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent", "NFileDescriptorStore": "0", "NRestarts": "5", "NUMAPolicy": "n/a", "Names": "app.service", "NeedDaemonReload": "no", "Nice": "0", "NoNewPrivileges": "no", "NonBlocking": "no", "NotifyAccess": "none", "OOMPolicy": "stop", "OOMScoreAdjust": "0", "OnFailureJobMode": "replace", "OnSuccessJobMode": "fail", "Perpetual": "no", "PrivateDevices": "no", "PrivateIPC": "no", "PrivateMounts": "no", "PrivateNetwork": "no", "PrivateTmp": "no", "PrivateUsers": "no", "ProcSubset": "all", "ProtectClock": "no", "ProtectControlGroups": "no", "ProtectHome": "no", "ProtectHostname": "no", "ProtectKernelLogs": "no", "ProtectKernelModules": "no", "ProtectKernelTunables": "no", "ProtectProc": "default", "ProtectSystem": "no", "RefuseManualStart": "no", "RefuseManualStop": "no", "ReloadResult": "success", "ReloadSignal": "1", "RemainAfterExit": "no", "RemoveIPC": "no", "Requires": "-.mount sysinit.target system.slice", "RequiresMountsFor": "/opt/app", "Restart": "always", "RestartKillSignal": "15", "RestartMaxDelayUSec": "infinity", "RestartMode": "normal", "RestartSteps": "0", "RestartUSec": "100ms", "RestartUSecNext": "100ms", "RestrictNamespaces": "no", "RestrictRealtime": "no", "RestrictSUIDSGID": "no", "Result": "exit-code", "RootDirectoryStartOnly": "no", "RootEphemeral": "no", "RootImagePolicy": "root=verity+signed+encrypted+unprotected+absent:usr=verity+signed+encrypted+unprotected+absent:home=encrypted+unprotected+absent:srv=encrypted+unprotected+absent:tmp=encrypted+unprotected+absent:var=encrypted+unprotected+absent", "RuntimeDirectoryMode": "0755", "RuntimeDirectoryPreserve": "no", "RuntimeMaxUSec": "infinity", "RuntimeRandomizedExtraUSec": "0", "SameProcessGroup": "no", "SecureBits": "0", "SendSIGHUP": "no", "SendSIGKILL": "yes", "SetLoginEnvironment": "no", "Slice": "system.slice", "StandardError": "inherit", "StandardInput": "null", "StandardOutput": "journal", "StartLimitAction": "none", "StartLimitBurst": "5", "StartLimitIntervalUSec": "10s", "StartupBlockIOWeight": "[not set]", "StartupCPUShares": "[not set]", "StartupCPUWeight": "[not set]", "StartupIOWeight": "[not set]", "StartupMemoryHigh": "infinity", "StartupMemoryLow": "0", "StartupMemoryMax": "infinity", "StartupMemorySwapMax": "infinity", "StartupMemoryZSwapMax": "infinity", "StateChangeTimestamp": "Wed 2024-12-11 09:13:11 UTC", "StateChangeTimestampMonotonic": "2818372118", "StateDirectoryMode": "0755", "StatusErrno": "0", "StopWhenUnneeded": "no", "SubState": "failed", "SuccessAction": "none", "SurviveFinalKillSignal": "no", "SyslogFacility": "3", "SyslogLevel": "6", "SyslogLevelPrefix": "yes", "SyslogPriority": "30", "SystemCallErrorNumber": "2147483646", "TTYReset": "no", "TTYVHangup": "no", "TTYVTDisallocate": "no", "TasksAccounting": "yes", "TasksCurrent": "[not set]", "TasksMax": "1130", "TimeoutAbortUSec": "1min 30s", "TimeoutCleanUSec": "infinity", "TimeoutStartFailureMode": "terminate", "TimeoutStartUSec": "1min 30s", "TimeoutStopFailureMode": "terminate", "TimeoutStopUSec": "1min 30s", "TimerSlackNSec": "50000", "Transient": "no", "Type": "simple", "UID": "[not set]", "UMask": "0022", "UnitFilePreset": "enabled", "UnitFileState": "enabled", "UtmpMode": "init", "WantedBy": "multi-user.target", "WatchdogSignal": "6", "WatchdogTimestampMonotonic": "0", "WatchdogUSec": "0", "WorkingDirectory": "/opt/app"}}

PLAY RECAP ***********************************************************************************************************************************************************************************************
app_instance               : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
   
```
</details>

### Use curl to check
```bash
curl -I 3.71.32.51:8000
HTTP/1.1 200 OK
Server: gunicorn
Date: Wed, 11 Dec 2024 09:34:09 GMT
Connection: close
Content-Type: text/html; charset=utf-8
Content-Length: 3452
```

### Checking the database
```bash
ssh -i ~/.aws/web-key.pem ubuntu@3.71.32.51
Welcome to Ubuntu 24.04.1 LTS (GNU/Linux 6.8.0-1020-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Dec 11 09:18:33 UTC 2024

  System load:  0.0               Processes:             110
  Usage of /:   40.6% of 6.71GB   Users logged in:       0
  Memory usage: 26%               IPv4 address for enX0: 192.168.0.84
  Swap usage:   0%
```
```bash
ssh -i ~/.ssh/web-key.pem ubuntu@192.168.0.180
Welcome to Ubuntu 24.04.1 LTS (GNU/Linux 6.8.0-1016-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Dec 11 09:20:28 UTC 2024

  System load:  0.0               Processes:             105
  Usage of /:   34.2% of 6.71GB   Users logged in:       0
  Memory usage: 58%               IPv4 address for enX0: 192.168.0.180
  Swap usage:   0%

```
```bash
sudo mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.40-0ubuntu0.24.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use flask_db
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> show tables;
+--------------------+
| Tables_in_flask_db |
+--------------------+
| requests           |
+--------------------+
1 row in set (0.00 sec)

mysql> select * from requests;
+----+-----------------+--------------+----------------------------+
| id | hostname        | remote_ip    | date                       |
+----+-----------------+--------------+----------------------------+
|  1 | ip-192-168-0-84 | 93.170.46.28 | 2024-12-11 09:03:30.609905 |
|  2 | ip-192-168-0-84 | 93.170.46.28 | 2024-12-11 09:10:29.714304 |
|  3 | ip-192-168-0-84 | 93.170.46.28 | 2024-12-11 09:16:34.000843 |
|  4 | ip-192-168-0-84 | 93.170.46.28 | 2024-12-11 09:16:38.258444 |
+----+-----------------+--------------+----------------------------+
4 rows in set (0.00 sec)

```