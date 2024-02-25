**Assignment today:**

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