
#### List of variables:
```.bash
# VPC CIDR IP address block
VPC_CIDR="192.168.0.0/24"
# Public subnet CIDR IP address block
PUB_SUBNET_CIDR="192.168.0.0/25"
# Private subnet CIDR IP- sg_FRONT
PRI_SUBNET_CIDR="192.168.0.128/25"
VPС_ID=""
sg_FRONT=""
sg_BACK=""
# Internet gateway ID
IGW_ID=""
# Route table ID
RT_ID="" 
```
<br>

#### Get a list of users and groups from IAM IC:
``` bash
./get_users_gpoups_IAMIC.py
```
<details>

```bash
=== Users ===
UserId: 90cc599c-20b1-7078-f7c6-9dbdcf809d43, Username: admin

=== Groups ===
GroupId: d0bc396c-50b1-70c6-d9ec-dd8dd355deff, DisplayName: admins
```
</details>
<details>

```python
File contents ./get_users_gpoups_IAMIC.py:


#!/usr/bin/python3

import boto3

# Указание профиля с SSO
session = boto3.Session(profile_name='admin')
client_identitystore = session.client('identitystore', region_name='eu-north-1')
client_iam = session.client('iam', region_name='eu-north-1')

identity_store_id = 'd-c3670d5ba2'

# Получаем список пользователей
response_users = client_identitystore.list_users(
    IdentityStoreId=identity_store_id
)

print("=== Users ===")
for user in response_users['Users']:
    print(f"UserId: {user['UserId']}, Username: {user['UserName']}")

# Получаем список групп
response_groups = client_identitystore.list_groups(
    IdentityStoreId=identity_store_id
)

print("\n=== Groups ===")
for group in response_groups['Groups']:
    print(f"GroupId: {group['GroupId']}, DisplayName: {group['DisplayName']}")

    # Получаем политики для каждой группы через IAM
    group_name = group['DisplayName']

    try:
        # Получаем политики для группы
        attached_policies = client_iam.list_attached_group_policies(
            GroupName=group_name
        )

        print(f"Policies for group {group_name}:")
        for policy in attached_policies['AttachedPolicies']:
            print(f"  PolicyName: {policy['PolicyName']}, PolicyArn: {policy['PolicyArn']}")

    except client_iam.exceptions.NoSuchEntityException:
        print(f"  No policies attached to group {group_name}")
```
</details>
<br>   

#### Access to the console for the admin user via the sso login using two-factor authentication:
```bash 
aws sso login
```
<details>

```bash
Attempting to automatically open the SSO authorization page in your default browser.
If the browser does not open or you wish to use a different device to authorize this request, open the following URL:

https://device.sso.eu-north-1.amazonaws.com/

Then enter the code:

CNSB-HCFS
Successfully logged into Start URL: https://d-c3670d5ba2.awsapps.com/start/#
```
</details>
<br>   

#### Create VPC:
```bash 
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --tag-specifications 'ResourceType=vpc,Tags=[{Key=name,Value=hw-3}]' --query "Vpc.VpcId" --output text)
```
<br>   

#### Get VPC_ID:

```bash 
aws ec2 describe-vpcs --vpc-id $VPC_ID
```
<details>

```json
{
    "Vpcs": [
        {
            "OwnerId": "941377130262",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0d9d40b39a8d75d01",
                    "CidrBlock": "192.168.0.0/24",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "name",
                    "Value": "hw-3"
                }
            ],
            "VpcId": "vpc-0f3756fc78efdf7e0",
            "State": "available",
            "CidrBlock": "192.168.0.0/24",
            "DhcpOptionsId": "dopt-0d1eb5e701ae079db"
        }
    ]
}
```
</details>
<br>

#### Create subnet - public:
```bash
PUB_SUBNET_Id=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $PUB_SUBNET_CIDR  --tag-specifications 'ResourceType=subnet,Tags=[{Key=name,Value=public}]' --query "Subnet.SubnetId" --output text)
```
<details>

```bash
aws ec2 describe-subnets --subnet-id $PUB_SUBNET_Id
```
```json
{
    "Subnets": [
        {
            "AvailabilityZoneId": "euc1-az3",
            "MapCustomerOwnedIpOnLaunch": false,
            "OwnerId": "941377130262",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "name",
                    "Value": "public"
                }
            ],
            "SubnetArn": "arn:aws:ec2:eu-central-1:941377130262:subnet/subnet-0d804ba4c12249828",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "SubnetId": "subnet-0d804ba4c12249828",
            "State": "available",
            "VpcId": "vpc-0f3756fc78efdf7e0",
            "CidrBlock": "192.168.0.0/25",
            "AvailableIpAddressCount": 123,
            "AvailabilityZone": "eu-central-1b",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false
        }
    ]
}
```
</details>

<br>

#### Create subnet - private:
```bash
PRI_SUBNET_Id=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $PRI_SUBNET_CIDR  --tag-specifications 'ResourceType=subnet,Tags=[{Key=name,Value=private}]' --query "Subnet.SubnetId" --output text)
```
<details>

```bash
aws ec2 describe-subnets --subnet-id $PRI_SUBNET_Id
```
```json
{
    "Subnets": [
        {
            "AvailabilityZoneId": "euc1-az3",
            "MapCustomerOwnedIpOnLaunch": false,
            "OwnerId": "941377130262",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "name",
                    "Value": "private"
                }
            ],
            "SubnetArn": "arn:aws:ec2:eu-central-1:941377130262:subnet/subnet-057cfac48f6066432",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "SubnetId": "subnet-057cfac48f6066432",
            "State": "available",
            "VpcId": "vpc-0f3756fc78efdf7e0",
            "CidrBlock": "192.168.0.128/25",
            "AvailableIpAddressCount": 123,
            "AvailabilityZone": "eu-central-1b",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false
        }
    ]
}
```
</details>
<br>   


#### Create security group sg_FRONT and assign traffic permissions:
```bash
sg_FRONT=$(aws ec2 create-security-group --group-name _sg-FRONT --description "for access from outside" --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=sg-FRONT}]' --vpc-id $VPC_ID --query 'GroupId' --output text)
aws ec2 authorize-security-group-ingress --group-id $sg_FRONT --protocol tcp --port 22 --cidr "0.0.0.0/0"
aws ec2 authorize-security-group-egress --group-id $sg_FRONT --protocol -1 --port all --cidr "0.0.0.0/0"
```
<details>

```bash
aws ec2 describe-security-groups --group-ids $sg_FRONT
```
```json
{
    "SecurityGroups": [
        {
            "GroupId": "sg-0579d986282e29316",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "sg-FRONT"
                }
            ],
            "VpcId": "vpc-0f3756fc78efdf7e0",
            "OwnerId": "941377130262",
            "GroupName": "_sg-FRONT",
            "Description": "for access from outside",
            "IpPermissions": [
                {
                    "IpProtocol": "tcp",
                    "FromPort": 22,
                    "ToPort": 22,
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ]
        }
    ]
}
```
</details>
<br> 

#### Create security group sg_BACK and assign traffic permissions:
```bash
sg_BACK=$(aws ec2 create-security-group --group-name _sg-BACK --description "for access from outside" --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=sg-BACK}]' --vpc-id $VPC_ID --query 'GroupId' --output text)
aws ec2 authorize-security-group-ingress --group-id $sg_BACK --protocol -1 --port all --source-group $sg_FRONT
aws ec2 authorize-security-group-egress --group-id $sg_BACK --protocol -1 --port all --cidr "0.0.0.0/0"
```
<details>

```bash
aws ec2 describe-security-groups --group-ids $sg_BACK
```
```json
{
    "SecurityGroups": [
        {
            "GroupId": "sg-081df681a04fbd277",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "UserIdGroupPairs": [],
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "sg-BACK"
                }
            ],
            "VpcId": "vpc-0f3756fc78efdf7e0",
            "OwnerId": "941377130262",
            "GroupName": "_sg-BACK",
            "Description": "for access from outside",
            "IpPermissions": [
                {
                    "IpProtocol": "-1",
                    "UserIdGroupPairs": [
                        {
                            "UserId": "941377130262",
                            "GroupId": "sg-0579d986282e29316"
                        }
                    ],
                    "IpRanges": [],
                    "Ipv6Ranges": [],
                    "PrefixListIds": []
                }
            ]
        }
    ]
}
```
</details>
<br> 

#### Create Internet Gateway and attach to VPC 
```bash
IGW_ID=$(aws ec2 create-internet-gateway --query "InternetGateway.InternetGatewayId" --output text)
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID
```
<br>

#### Create Route Table ID and adding a route to an Internet gateway and assignment of the routing table to the subnet:
```bash
RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query "RouteTable.RouteTableId" --output text)
aws ec2 create-route --route-table-id $RT_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
aws ec2 associate-route-table  --subnet-id $PUB_SUBNET_Id --route-table-id $RT_ID
```
<br>

#### Сreat instance - WEB
```bash
aws ec2 run-instances \
--image-id ami-013507e90ff3fcea8 \
--count 1 \
--instance-type t2.micro \
--key-name web-key \
--security-group-ids $sg_FRONT \
--subnet-id $PUB_SUBNET_Id \
--block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":30,\"DeleteOnTermination\":false}}]" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WEB}]' 'ResourceType=volume,Tags=[{Key=Name,Value=WEB-disk}]' \
--associate-public-ip-address
```
<br>

<details>

```json
{
    "ReservationId": "r-02b0103a18039edeb",
    "OwnerId": "941377130262",
    "Groups": [],
    "Instances": [
        {
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "12a60e10-2cb8-40a7-ab2c-34fb02e75ac0",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2024-11-02T09:19:07+00:00",
                        "AttachmentId": "eni-attach-087d6cf5a370d51c7",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupId": "sg-0579d986282e29316",
                            "GroupName": "_sg-FRONT"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:65:49:88:73:af",
                    "NetworkInterfaceId": "eni-020d9e9b7e78570dc",
                    "OwnerId": "941377130262",
                    "PrivateIpAddress": "192.168.0.81",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "192.168.0.81"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0d804ba4c12249828",
                    "VpcId": "vpc-0f3756fc78efdf7e0",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0579d986282e29316",
                    "GroupName": "_sg-FRONT"
                }
            ],
            "SourceDestCheck": true,
```
</details>

<br>

#### Get elastic ip for WEB instance:

```bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=WEB" --query "Reservations[*].Instances[*].PublicIpAddress" --output text
52.58.191.87
```
<br> 

#### Сreat instance - DB
```bash
aws ec2 run-instances \
--image-id ami-013507e90ff3fcea8 \
--count 1 \
--instance-type t2.micro \
--key-name web-key \
--security-group-ids $sg_BACK \
--subnet-id $PRI_SUBNET_Id \
--block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":30,\"DeleteOnTermination\":false}}]" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DB}]' 'ResourceType=volume,Tags=[{Key=Name,Value=DB-disk}]' 
```
<br>

<details>

```json
{
    "ReservationId": "r-0ea54724ab1e08af4",
    "OwnerId": "941377130262",
    "Groups": [],
    "Instances": [
        {
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "d3a826b2-643a-40bc-9a35-77408fa9864b",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2024-11-02T10:44:12+00:00",
                        "AttachmentId": "eni-attach-05f6f33b934fdcb5d",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupId": "sg-081df681a04fbd277",
                            "GroupName": "_sg-BACK"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:9b:3e:99:05:f9",
                    "NetworkInterfaceId": "eni-084f95562046b45e8",
                    "OwnerId": "941377130262",
                    "PrivateIpAddress": "192.168.0.170",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "192.168.0.170"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-057cfac48f6066432",
                    "VpcId": "vpc-0f3756fc78efdf7e0",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-081df681a04fbd277",
                    "GroupName": "_sg-BACK"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DB"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "required",
                "HttpPutResponseHopLimit": 2,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios",
            "InstanceId": "i-0e013e9b659a5484b",
            "ImageId": "ami-013507e90ff3fcea8",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "PrivateDnsName": "ip-192-168-0-170.eu-central-1.compute.internal",
            "PublicDnsName": "",
            "StateTransitionReason": "",
            "KeyName": "web-key",
            "AmiLaunchIndex": 0,
            "ProductCodes": [],
```
```bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=WEB" --query "Reservations[*].Instances[*].PublicIpAddress" --output text
18.197.33.19
aws ec2 describe-instances --instance-ids "i-051f015e13f66facb" --query "Reservations[*].Instances[*].PublicIpAddress" --output text
18.197.33.19
```
</details>

#### Display instances:
```bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, Tags]"
[
    [
        [
            "i-051f015e13f66facb",
            [
                {
                    "Key": "Name",
                    "Value": "WEB"
                }
            ]
        ]
    ],
    [
        [
            "i-0e013e9b659a5484b",
            [
                {
                    "Key": "Name",
                    "Value": "DB"
                }
            ]
        ]
    ]
]
```
<br>

#### Connect to WEB:
```bash
ssh -i web-key.pem ubuntu@52.58.191.87
The authenticity of host '52.58.191.87 (52.58.191.87)' can't be established.
ED25519 key fingerprint is SHA256:edOalleu9N3WrtN96Smw9L5cOIXaYQPRqJq4wXVA+9Q.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:4: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '52.58.191.87' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04 LTS (GNU/Linux 6.8.0-1013-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
Last login: Sat Nov  2 09:29:10 2024 from 93.170.44.28
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-192-168-0-81:~$ hostname
ip-192-168-0-81
ubuntu@ip-192-168-0-81:~$ curl ident.me
52.58.191.87
```
<br>

#### Connect to DB by db-host:
```bash
~/.ssh : root@test : Sat Nov 02 13:33:30
cat config
Host jump-host
  HostName 52.58.191.87
  User ubuntu
  IdentityFile ~/.ssh/web-key.pem

Host db-host
  HostName 192.168.0.170
  User ubuntu
  ProxyJump ubuntu@52.58.191.87
  IdentityFile ~/.ssh/web-key.pem
  ForwardAgent yes

~/.ssh : root@test : Sat Nov 02 13:33:37
ssh  db-host
Welcome to Ubuntu 24.04 LTS (GNU/Linux 6.8.0-1013-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Sat Nov  2 11:33:20 2024 from 192.168.0.81
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-192-168-0-170:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: enX0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 06:9b:3e:99:05:f9 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.170/25 metric 100 brd 192.168.0.255 scope global dynamic enX0
       valid_lft 2438sec preferred_lft 2438sec
    inet6 fe80::49b:3eff:fe99:5f9/64 scope link
       valid_lft forever preferred_lft forever
```
















