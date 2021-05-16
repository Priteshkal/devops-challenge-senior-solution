variable "region" {
  description = "AWS Deployment region"
  default = "us-east-1"
}

variable "cluster_name" {
  default = "particle41_eks_cluster"
  type    = string
}

data "aws_availability_zones" "available" {}