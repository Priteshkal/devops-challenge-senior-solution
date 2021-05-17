module "vpc" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git"
  name = "vpc-for-eks"
  cidr = "10.0.0.0/16"

  azs               = ["${var.region}a", "${var.region}b"]
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  single_nat_gateway = true

  vpc_tags = {
    Name = "vpc-for-eks"
  }
}