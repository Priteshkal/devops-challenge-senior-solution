module "eks" {
    # Module being imported from https://github.com/terraform-aws-modules/terraform-aws-eks/
  source  = "terraform-aws-modules/eks/aws"
  version = "12.2.0"

  cluster_name    = "${var.cluster_name}"
  cluster_version = "1.17"
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  node_groups = {
    first = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2

      instance_type = "${var.eksnode_instance_type}"
    }
  }

  write_kubeconfig   = true
  config_output_path = "./"
}