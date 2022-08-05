# SG frontEnd
resource "aws_security_group" "sg_frontend" {
  name   = "rampup_sg_sebastianUrrego_frontend"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  # TCP connections to the FrontEnd
  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTPS entrance
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTP entrance
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG bastion Host
resource "aws_security_group" "sg_bastion_host" {
  name   = "rampup_sg_sebastianUrrego_bastion_host"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTPS entrance
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTP entrance
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG jenkins
resource "aws_security_group" "sg_jenkins" {
  name   = "rampup_sg_sebastianUrrego_Jenkins"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins port
  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins port
  ingress {
    from_port   = 8043
    to_port     = 8043
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTPS entrance
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTP entrance
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins port
  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins port
  egress {
    from_port   = 8043
    to_port     = 8043
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG general backend
resource "aws_security_group" "sg_backend" {
  name   = "rampup_sg_sebastianUrrego_backend"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTPS entrance
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTP entrance
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG Users-api
resource "aws_security_group" "sg_users-api" {
  name   = "rampup_sg_sebastianUrrego_users-api"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 8083
    to_port     = 8083
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #PORT
  egress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG Auth-api
resource "aws_security_group" "sg_auth-api" {
  name   = "rampup_sg_sebastianUrrego_auth-api"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 8000
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }

  #PORT
  egress {
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG Todos-api
resource "aws_security_group" "sg_todos_api" {
  name   = "rampup_sg_sebastianUrrego_todos-api"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 8082
    to_port     = 8082
    cidr_blocks = ["0.0.0.0/0"]
  }

  #PORT
  egress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}

# SG Log message processor
resource "aws_security_group" "sg_log_message_processor" {
  name   = "rampup_sg_sebastianUrrego_log_message_proccesor"
  vpc_id = var.vpc_id

  # SSH connections
  ingress {
    protocol    = "tcp"
    from_port   = 6379
    to_port     = 6379
    cidr_blocks = ["0.0.0.0/0"]
  }

  #PORT
  egress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }
}
