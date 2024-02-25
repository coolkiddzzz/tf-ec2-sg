/*
**Assignment:**
- Create an EC2 using terraform that contains a new security group that allows:
- HTTP from anywhere
- HTTPS from anywhere
- TCP (SSH) from your IP address
- Do remember to give your security group a meaningful name so that you can easily identify the security group later on. Reference to create a security group - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
You may use an existing VPC ID for this in your chosen region.
- Default region = us-east-1
- Default AMI = ami-0e731c8a588258d0d
- Default VPC ID i would give recommend is vpc-02c3cea2893bac90f
- and Default Subnet ID is subnet-0d647d78d2309afc0
(Feel free to use your own if you'd like)
You may also use an existing key pair which will allow you to connect to your EC2 instance.
*/


resource "aws_instance" "webserver-1" {
  ami                         = var.aws_ami
  instance_type               = var.aws_instance_type
  associate_public_ip_address = "true"
  subnet_id                   = data.aws_subnet.selected_subnet.id
  vpc_security_group_ids      = [aws_security_group.wy_sg.id]
  tags = {
    Name = "${var.ec2_name}-webserver1"
  }

}

data "aws_subnet" "selected_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

data "aws_vpc" "selected_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

resource "aws_security_group" "wy_sg" {
  name        = "wy_sg_allow_http_https_ssh_from_ip_addr"
  description = "Allow http and https from anywhere and tcp(ssh) from my IP address"
  vpc_id      = data.aws_vpc.selected_vpc.id

  # HTTPS from anywhere
  ingress {
    description = "HTTPS ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP from anywhere
  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ssh from my ip address
  ingress {
    description = "SSH ingress from my IP address"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.6.151.37/32"]
  }
  # allow all traffic outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


