variable "region" {
  description = "AWS Deployment region"
  default = "us-east-1"
}

variable "cluster-name" {
  default = "terraform-eks"
  type    = string
}

data "aws_availability_zones" "available" {}