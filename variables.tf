variable "region" {
  description = "AWS Deployment region"
  default = "us-east-1"
  type    = string
}

variable "cluster_name" {
  description = "Cluster Name for EKS"
  default = "particle41_eks_cluster"
  type    = string
}

variable "vpc_name" {
  default = "particle41-vpc-eks"
  type    = string
}

variable "eksnode_instance_type" {
  default = "t3a.large"
  type    = string
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  type    = list
}

variable "public_subnets" {
  default = ["10.0.100.0/24", "10.0.101.0/24"]
  type    = list
}