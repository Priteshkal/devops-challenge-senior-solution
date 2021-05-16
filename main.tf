module "vpc" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git"

  name = "vpc-for-eks"
  cidr = "10.0.0.0/16"

  azs             = ["${var.region}a", "${var.region}b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-for-eks"
  }
}

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "vpc-for-eks"
#   }
# }


# ## Public Subnets - 10.0.0.0/24 and 10.0.1.0/24
# resource "aws_subnet" "public_subnets" {
#   count = 2

#   availability_zone       = data.aws_availability_zones.available.names[count.index]
#   cidr_block              = "10.0.${count.index}.0/24"
#   map_public_ip_on_launch = true
#   vpc_id                  = aws_vpc.main.id

# }

# ## Private Subnets - 10.0.100.0/24 and 10.0.101.0/24
# resource "aws_subnet" "private_subnets" {
#   count = 2

#   availability_zone       = data.aws_availability_zones.available.names[count.index]
#   cidr_block              = "10.0.10${count.index}.0/24"
#   map_public_ip_on_launch = false
#   vpc_id                  = aws_vpc.main.id

# }

# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "ig-for-terraform-eks"
#   }
# }

# resource "aws_route_table" "main" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main.id
#   }
# }

# resource "aws_route_table_association" "demo" {
#   count = 2

#   subnet_id      = aws_subnet.public_subnets.*.id[count.index]
#   route_table_id = aws_route_table.main.id
# }