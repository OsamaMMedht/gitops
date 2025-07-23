variable "policy_name" {
  type = string
}

variable "policy_description" {
  type    = string
  default = "Prod-Managed policy created via Terraform"
}

variable "policy_document" {
  type = string
}
