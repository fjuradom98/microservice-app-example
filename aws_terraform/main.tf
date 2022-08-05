terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}


# Public instance
resource "aws_instance" "frontend" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.public_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_frontend.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "frontend_su"
  }

  key_name = var.ssh_key
}

resource "aws_instance" "bastion_host" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.public_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_bastion_host.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "bastion_host"
  }

  key_name = var.ssh_key
}

resource "aws_instance" "jenkins_instance" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.public_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_jenkins.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "jenkins_su"
  }

  key_name = var.ssh_key
}


# module "ec2_instances" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "3.5.0"
#   count = 4

#   ami           = var.instance_ami
#   instance_type = var.type_instance
#   subnet_id     = var.private_subnets_id[0]

#   vpc_security_group_ids = [
#     aws_security_group.sg_backend.id,
#     aws_security_group.sg_log_message_processor.id,
#     aws_security_group.sg_auth.id,
#     aws_security_group.sg_todos_api,
#     aws_security_group.sg_users
#   ]


#   volume_tags = {
#     responsible = var.tag_responsible
#     project     = var.tag_project
#   }

#   tags = {
#     responsible = var.tag_responsible
#     project     = var.tag_project
#     Name        = var.name_instances[count.index]
#   }

#   key_name = var.ssh_key
# }


# Private instance - Users-api
resource "aws_instance" "users_api" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.private_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_backend.id,
    aws_security_group.sg_users-api.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "users-api_su"
  }

  key_name = var.ssh_key
}


# Private instance - auth-api
resource "aws_instance" "auth_api" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.private_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_backend.id,
    aws_security_group.sg_auth-api.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "auth-api_su"
  }

  key_name = var.ssh_key
}


# Private instance - todos-api
resource "aws_instance" "todos_api" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.private_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_backend.id,
    aws_security_group.sg_todos_api.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "todos-api_su"
  }

  key_name = var.ssh_key
}

# Private instance - Log message Proccesor
resource "aws_instance" "log_message_processor" {
  ami           = var.instance_ami
  instance_type = var.type_instance
  subnet_id     = var.private_subnets_id[0]
  vpc_security_group_ids = [
    aws_security_group.sg_backend.id,
    aws_security_group.sg_log_message_processor.id
  ]

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = "log_message_proccesor_su"
  }

  key_name = var.ssh_key
}
