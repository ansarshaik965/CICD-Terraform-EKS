variable "vpc_cidr" {
  description = "Vpc CIDR"
  type        = string
}

variable "public_subnets" {
  description = "public_subnets CIDR"
  type        = list(string)
}

variable "private_subnets" {
  description = "private_subnets CIDR"
  type        = list(string)
}

variable "instance_types" {
  description = "Node Instances"
  type        = list(string)
}