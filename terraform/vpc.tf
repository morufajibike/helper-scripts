data "aws_availability_zones" "available" {}

resource "aws_vpc" "demo_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    "Name" = "demo-vpc"
  }
}

resource "aws_subnet" "demo_public_subnet" {
  count             = 2
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = aws_vpc.demo_vpc.id
  map_public_ip_on_launch = "true"
  tags = {
    "Name" = "demo-public-subnet"
  }
}

resource "aws_internet_gateway" "demo" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo-igw"
  }
}

resource "aws_route_table" "demo" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo.id
  }
}

resource "aws_route_table_association" "demo" {
  count = 2

  subnet_id      = aws_subnet.demo_public_subnet[count.index].id
  route_table_id = aws_route_table.demo.id
}

output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}

output "subnet_ids" {
  # a list of subnet ids
  value = aws_subnet.demo_public_subnet.*.id
}

