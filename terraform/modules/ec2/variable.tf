variable "ami_id" {
    type = string
    default = "ami-05ffe3c48a9991133"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "associate_public_ip" {
  type    = bool
  default = true
}

variable "instance_name" {
  type = string
}
