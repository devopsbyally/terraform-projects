# Step 1 : Create RHEL instance where Jenkins will be added to USER SCRIPT to start at boot.
resource "aws_instance" "rhel-instance" {
    ami = data.aws_ami.rhel.id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags

user_data = <<-EOF
#!/bin/bash
yum install -y java-1.8.0-openjdk
# Add Jenkins repo and import GPG key
curl --silent --location https://pkg.jenkins.io/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
yum install -y jenkins

# Start and enable Jenkins service
systemctl start jenkins
systemctl enable jenkins

# Open port 8080 for Jenkins
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload
EOF
}

# Step 2: create a security group for SSH 
resource "aws_security_group" "ssh_sg-1" {
  name        = "ssh-sg-1"
  description = "Allow SSH inbound traffic on port 22"

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg-1"
  }
}

# Step 3: create a security group for HTTP 
resource "aws_security_group" "http_sg-1" {
  name        = "http-sg-1"
  description = "Allow HTTP inbound traffic on port 80"

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-sg-1"
  }
}