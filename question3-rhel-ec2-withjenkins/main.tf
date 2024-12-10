# Step 1 : Create RHEL instance where Jenkins will be added to USER SCRIPT to start at boot.
resource "aws_instance" "rhel-instance" {
    ami = data.aws_ami.rhel.id
    instance_type = var.instance_type
    key_name = var.key_name
  
user_data = file("${path.module}/user-data-jenkins.sh")

  tags = merge(var.tags, {
    Name = "Jenkins-Server"
  })
}

# Step 2: create a security group for SSH and HTTP
resource "aws_security_group" "ssh_and_http_sg" {
  name        = "ssh-and-http-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "Allow SSH (Port 22)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP (Port 80)"
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
    Name = "ssh-and-http-sg"
  }
}