module "eks" {
  source       = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git"
  cluster_name = "${var.cluster_name}"
  cluster_version = "1.17"
  vpc_id       = module.vpc.vpc_id #aws_vpc.main.id
  subnets      = module.vpc.private_subnets #aws_subnet.private_subnets.*.id
  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t3a.large"
      asg_desired_capacity          = 2
    }
    ]

#   node_groups = {
#     eks_nodes = {
#       desired_capacity = 2
#       max_capacity     = 2
#       min_capacity     = 2
#       instance_types    = "t3a.large"
#     }
#   }

  manage_aws_auth = false
}