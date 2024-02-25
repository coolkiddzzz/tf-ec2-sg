variable "security_group_name" {
  description = "security_group_name"
  type        = string
  default     = "mwaiyee-allow-http-https-ssh-from-ip"
}

variable "aws_ami" {
  type    = string
  default = "ami-0e731c8a588258d0d"
}

variable "aws_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_name" {
  type    = string
  default = "main-subnet-public1-us-east-1a"

}

variable "vpc_name" {
  type    = string
  default = "main-vpc"
}

variable "ec2_name" {
  type    = string
  default = "mwaiyee-ec2"
}