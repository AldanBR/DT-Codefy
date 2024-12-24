variable "tagging_name"{
    default = "DT-Alefe-ec2"
}
variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "allowed_ssh_ip" {
  type = string
}
