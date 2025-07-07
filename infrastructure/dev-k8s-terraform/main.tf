provider "aws" {
  region  = "us-east-1"
}

variable "sec-gr-k8s" {
  default = "petclinic-k8s-sec-group"
}

variable "keypair" {
  default = "baby"
}

data "aws_vpc" "name" {
  default = true
}

resource "aws_security_group" "k8s-sec-gr" {
  name = var.sec-gr-k8s
  vpc_id = data.aws_vpc.name.id
  tags = {
    Name = var.sec-gr-k8s
  }

  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    self = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 6443
    to_port = 6443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_iam_role" "petclinic-master-server-s3-role" {
  name               = "petclinic-master-server-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "petclinic_s3_policy" {
  role       = aws_iam_role.petclinic-master-server-s3-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "petclinic-master-server-profile" {
  name = "petclinic-master-server-profile"
  role = aws_iam_role.petclinic-master-server-s3-role.name
}

resource "aws_instance" "kube-master" {
  ami = "ami-0a7d80731ae1b2435"
  instance_type = "t3a.medium"
  iam_instance_profile = aws_iam_instance_profile.petclinic-master-server-profile.name
  vpc_security_group_ids = [aws_security_group.k8s-sec-gr.id]
  key_name = var.keypair
  subnet_id = "subnet-05db8852e3a3f8053"  # select own subnet_id of us-east-1a
  availability_zone = "us-east-1a"
  tags = {
    Name = "kube-master"
    Project = "tera-kube-ans"
    Role = "master"
    Id = "1"
    environment = "dev"
  }
}

resource "aws_instance" "worker-1" {
  ami = "ami-0a7d80731ae1b2435"
  instance_type = "t3a.medium"
  vpc_security_group_ids = [aws_security_group.k8s-sec-gr.id]
  key_name = var.keypair
  subnet_id = "subnet-05db8852e3a3f8053"  # select own subnet_id of us-east-1a
  availability_zone = "us-east-1a"
  tags = {
    Name = "worker-1"
    Project = "tera-kube-ans"
    Role = "worker"
    Id = "1"
    environment = "dev"
  }
}

resource "aws_instance" "worker-2" {
  ami = "ami-0a7d80731ae1b2435"
  instance_type = "t3a.medium"
  vpc_security_group_ids = [aws_security_group.k8s-sec-gr.id]
  key_name = var.keypair
  subnet_id = "subnet-05db8852e3a3f8053"  # select own subnet_id of us-east-1a
  availability_zone = "us-east-1a"
  tags = {
    Name = "worker-2"
    Project = "tera-kube-ans"
    Role = "worker"
    Id = "2"
    environment = "dev"
  }
}

output kube-master-ip {
  value       = aws_instance.kube-master.public_ip
  sensitive   = false
  description = "public ip of the kube-master"
}

output worker-1-ip {
  value       = aws_instance.worker-1.public_ip
  sensitive   = false
  description = "public ip of the worker-1"
}

output worker-2-ip {
  value       = aws_instance.worker-2.public_ip
  sensitive   = false
  description = "public ip of the worker-2"
}