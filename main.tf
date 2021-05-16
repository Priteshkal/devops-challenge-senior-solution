resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-for-eks"
  }
}


## Public Subnets - 10.0.0.0/24 and 10.0.1.0/24
resource "aws_subnet" "public_subnets" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id

}

## Private Subnets - 10.0.100.0/24 and 10.0.101.0/24
resource "aws_subnet" "private_subnets" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = "10.0.10${count.index}.0/24"
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id

}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ig-for-terraform-eks"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "demo" {
  count = 2

  subnet_id      = aws_subnet.public_subnets.*.id[count.index]
  route_table_id = aws_route_table.main.id
}