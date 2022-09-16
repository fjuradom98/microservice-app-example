provider "aws" {
  region  = "us-west-1"
}


locals {
  instances = flatten(local.serverconfig)


  serverconfig = [
    for srv in local.configuration : [
      for i in range(1, srv.no_of_instances+1) : {
        instance_name = "${srv.application_name}-${i}"
        instance_type = srv.instance_type
        subnet_id   = srv.subnet_id
        ami = srv.ami
        security_groups = srv.vpc_security_group_ids
      }
    ]
  ]

configuration = [
  {
    application_name = "frontend"
    ami = "ami-085284d24fe829cd0"
    no_of_instances = 1
    instance_type = "t2.micro"
    subnet_id = "subnet-xxxxxxxx",
    vpc_security_group_ids = ["sg-testing-0-id-xxxx"]
  },
  {
    application_name = "bastion"
    ami = "ami-085284d24fe829cd0"
    no_of_instances = 1
    instance_type = "t2.micro"
    subnet_id = "subnet-xxxxxx",
    vpc_security_group_ids = ["sg-testing-1-id-xxxx"]
  }
]

}


# Public instance
resource "aws_instance" "frontend" {
  for_each = {for server in local.instances: server.instance_name =>  server}


  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id
  vpc_security_group_ids = each.value.security_groups

  volume_tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
  }

  tags = {
    responsible = var.tag_responsible
    project     = var.tag_project
    Name        = each.value.instance_name
  }

  key_name = var.ssh_key
}

/*
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

*/
##############################################################################################
# SG frontEnd
resource "aws_security_group" "sg_frontend" {
  name   = "rampup_sg_felipej_frontend"
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
  name   = "rampup_sg_felipej_bastion"
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
