## Packer app
```bash
~/packer.test/hw-5 : root@test : Mon Nov 25 21:18:58
packer validate -var-file=variables.pkrvars.hcl app.pkr.hcl
The configuration is valid.

~/packer.test/hw-5 : root@test : Mon Nov 25 21:19:00
packer build -var-file=variables.pkrvars.hcl app.pkr.hcl

...
==> Builds finished. The artifacts of successful builds are:
--> app-build.amazon-ebs.app: AMIs were created:
eu-central-1: ami-04498dd41182069f8
```

## Packer DB
```bash
~/packer.test/hw-5 : root@test : Mon Nov 25 21:36:59
packer validate -var-file=variables.pkrvars.hcl db.pkr.hcl
The configuration is valid.

~/packer.test/hw-5 : root@test : Mon Nov 25 21:37:06
packer build -var-file=variables.pkrvars.hcl db.pkr.hcl

...
==> Builds finished. The artifacts of successful builds are:
--> db-build.amazon-ebs.db: AMIs were created:
eu-central-1: ami-0f952c4c0f7914d1b
```

## Terraform

```bash
~/terraform.test/hw-5 : root@test : Mon Nov 25 21:46:11
terraform apply

...
db_instance_id = "i-07b2a2bc685e16b13"
db_private_ip = "192.168.0.167"
web_instance_dns = "ec2-52-28-208-33.eu-central-1.compute.amazonaws.com"
web_instance_id = "i-07c144b6bebc1d229"
web_private_ip = "192.168.0.6"
web_public_ip = "52.28.208.33"
```

## Flask

```bash
ubuntu@ip-192-168-0-6:~/flask-alb-app$ . venv/bin/activate
(venv) ubuntu@ip-192-168-0-6:~/flask-alb-app$ gunicorn -b 0.0.0.0 appy:app
[2024-11-25 20:37:58 +0000] [1337] [INFO] Starting gunicorn 23.0.0
[2024-11-25 20:37:58 +0000] [1337] [INFO] Listening at: http://0.0.0.0:8000 (1337)
[2024-11-25 20:37:58 +0000] [1337] [INFO] Using worker: sync
[2024-11-25 20:37:58 +0000] [1338] [INFO] Booting worker with pid: 1338
config = mysql
creating app with config = mysql
```

### Curl

```bash
E:\>curl -I http://52.28.208.33:8000/
HTTP/1.1 200 OK
Server: gunicorn
Date: Mon, 25 Nov 2024 20:39:48 GMT
Connection: close
Content-Type: text/html; charset=utf-8
Content-Length: 3451
```

### DB

```bash
Last login: Mon Nov 25 20:02:19 2024 from 192.168.0.6
ubuntu@ip-192-168-0-167:~$ sudo mariadb flask_db
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 36
Server version: 10.11.8-MariaDB-0ubuntu0.24.04.1 Ubuntu 24.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [flask_db]> select * from requests;
+----+----------------+--------------+----------------------------+
| id | hostname       | remote_ip    | date                       |
+----+----------------+--------------+----------------------------+
|  1 | ip-192-168-0-6 | 93.170.46.28 | 2024-11-25 19:56:26.864715 |
|  2 | ip-192-168-0-6 | 93.170.46.28 | 2024-11-25 20:39:02.259004 |
|  3 | ip-192-168-0-6 | 93.170.46.28 | 2024-11-25 20:39:32.980680 |
|  4 | ip-192-168-0-6 | 93.170.46.28 | 2024-11-25 20:39:48.625578 |
+----+----------------+--------------+----------------------------+
4 rows in set (0.000 sec)
```
