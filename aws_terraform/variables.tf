# Type of the instance AMI
variable "instance_ami" {
  type    = string
  default = "ami-085284d24fe829cd0"
}

#Instances names
variable "name_instances" {
  description = "Names of the instances"
  type        = list(string)
  default     = ["log_message_proccesor_su", "todos-api_su", "auth-api_su", "users-api_su"]
}

# Tags for responsible
variable "tag_responsible" {
  description = "Responsible tag for AWS"
  type        = string
  default     = "sebastian.urregog"
}

# Tags for the project
variable "tag_project" {
  description = "Project tag for AWS"
  type        = string
  default     = "ramp-up-devops"
}

# Name of the SSH key
variable "ssh_key" {
  description = "Name of the SSH key that we are going to use"
  type        = string
  default     = "rampup-sebastianUrrego"
}

# VPC ID
variable "vpc_id" {
  description = "VPC id for the security groups"
  type        = string
  default     = "vpc-0d2831659ef89870c"
}

# public Subnet IDS
variable "public_subnets_id" {
  description = "List of public subnets IDs"
  type        = list(string)
  default     = ["subnet-0088df5de3a4fe490", "subnet-055c41fce697f9cca"]
}

# Private subnets IDs
variable "private_subnets_id" {
  description = "List of private subnets IDs"
  type        = list(string)
  default     = ["subnet-0d74b59773148d704", "subnet-038fa9d9a69d6561e"]
}

# Tyoe if instance
variable "type_instance" {
  description = "Type of the instance that we are going to use"
  type        = string
  default     = "t2.micro"
}