variable "name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
  default = "postgres"
}

variable "password" {
  type      = string
  default = "P@$$w0rd"
  sensitive = true
}

variable "engine_version" {
  type    = string
  default = "15.3"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "max_allocated_storage" {
  type    = number
  default = 100
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "multi_az" {
  type    = bool
  default = false
}