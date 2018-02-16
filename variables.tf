variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable instance_type {
  description = "EC2 instance type that will be launched"
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "Path to a public ssh key"
  default     = "~/.ssh/code-deploy-demo.pub"
}

variable "private_key_path" {
  description = "Path to a private ssh key"
  default     = "~/.ssh/code-deploy-demo"
}
