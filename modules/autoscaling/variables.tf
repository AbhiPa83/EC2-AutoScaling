variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "sg_id" {
  description = "The ID of the security group"
  type        = string
}