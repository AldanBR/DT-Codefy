variable "tagging_name"{
    default = "DT-Alefe-RDS"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "security_group" {
  type = string
}