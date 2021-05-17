module "eks" {
  source       = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git"
  cluster_name = "${var.cluster_name}"
  cluster_version = "1.17"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.private_subnets

  worker_groups = [
    {
      instance_type = "t3a.large"
      desired_capacity = 2
      asg_max_size  = 5
    }
  ]

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 50
  }

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2
      instance_type = "t3a.large"
      k8s_labels = {
        eks       = "true"
      }
      additional_tags = {
        Company       = "Particle 41"
      }
    }
  }
  manage_aws_auth = false

}

# module "eks" {
#   source       = "git::https://github.com/devopsmakers/terraform-aws-eks" #"git::https://github.com/terraform-aws-modules/terraform-aws-eks.git"
#   cluster_name = "${var.cluster_name}"
#   cluster_version = "1.17"
#   vpc_id       = module.vpc.vpc_id
#   subnets      = module.vpc.private_subnets

#   node_groups_defaults = {
#     ami_type  = "AL2_x86_64"
#     disk_size = 50
#   }

#   tags = {
#     Environment = "test"
#     GithubRepo  = "terraform-aws-eks"
#     GithubOrg   = "terraform-aws-modules"
#   }

#   node_groups = {
#     eks_node_group = {
#       desired_capacity = 2
#       max_capacity     = 2
#       min_capacity     = 2

#       instance_type = "t3a.large"
#       k8s_labels = {
#         Environment = "test"
#         GithubRepo  = "terraform-aws-eks"
#         GithubOrg   = "terraform-aws-modules"
#       }
#     }
#   }

# }