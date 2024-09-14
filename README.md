# AWS EC2 with NGINX Deployment using Terraform

This project automates the provisioning of an EC2 instance in AWS, installs NGINX, and configures HTTP access using Terraform. The infrastructure is defined as code (IaC), making it easy to scale and manage.

## Project Overview

### Features:
- **VPC**: A custom Virtual Private Cloud is created with subnets and internet access.
- **EC2 Instance**: Launches an EC2 instance using an Amazon Linux 2 AMI.
- **NGINX Installation**: Installs and configures NGINX using user data.
- **Security Group**: Allows inbound HTTP (port 80) and SSH (port 22) traffic to the instance.

### Prerequisites:
Make sure you have the following tools installed:
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- A configured AWS account with access keys.

## Project Structure

```plaintext
.
├── main.tf                 # Main Terraform file
├── variables.tf            # Variables file
├── ec2.tf                  # EC2 instance configuration
├── security-group.tf       # Security Group configuration
├── vpc.tf                  # VPC configuration
├── outputs.tf              # Outputs for EC2 public IP, etc.
├── README.md               # Project documentation
└── .gitignore              # Git ignore file

Architecture Diagram
VPC: A custom VPC with public subnets and an internet gateway.
Security Group: Configured for HTTP (80) and SSH (22) access.
EC2: An EC2 instance running Amazon Linux 2 with NGINX installed using user data.
NGINX: Accessible via the EC2 instance's public IP address on port 80.
Usage
1. Clone the Repository
bash
Copy code
git clone https://github.com/yourusername/aws-ec2-nginx-terraform.git
cd aws-ec2-nginx-terraform
2. Initialize Terraform
Initialize the Terraform working directory to download provider plugins and prepare the environment:

bash
Copy code
terraform init
3. Update variables.tf
Modify the variables.tf file to customize parameters like the region, instance type, or VPC subnet IDs.

4. Run Terraform Apply
To create the infrastructure, run:

bash
Copy code
terraform apply
After reviewing the plan, type yes to proceed.

5. Access NGINX
Once the instance is deployed, access NGINX by navigating to the public IP address provided by Terraform:

bash
Copy code
http://<your-ec2-public-ip>
6. Destroy the Infrastructure
To clean up the resources after use, run:

bash
Copy code
terraform destroy
Confirm the action with yes.

Example EC2 Configuration
This EC2 instance uses a user_data script to install NGINX on an Amazon Linux 2 instance:
hcl
Copy code
user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install nginx1 -y
    systemctl start nginx
    systemctl enable nginx
EOF

Outputs
Terraform will output the public IP of the EC2 instance after deployment. You can use this IP to access NGINX via a browser.

THIS IS THE TERRRAFORM CAMMAND TO RUN THIS CODE:
    terraform init
    terraform validate
    terraform plan
    terraform apply
