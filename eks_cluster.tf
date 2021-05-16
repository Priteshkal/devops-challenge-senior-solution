module "eks" {
  source       = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git"
  cluster_name = "particle41_ekc_cluster"
  cluster_version = "1.17"
  vpc_id       = aws_vpc.main.id
  subnets      = aws_subnet.private_subnets.*.id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2
      instance_type = "t3a.large"
    }
  }

  manage_aws_auth = false
}