#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "demo" {
  cidr_block = var.vpc_cdir_block

  tags = map(
    "Name", "eks-nfesta-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_subnet" "demo1" {

  availability_zone       = var.availability_zone[0]
  cidr_block              = var.subnet_cdir_block[0]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.demo.id

  tags = map(
    "Name", "eks-nfesta-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_subnet" "demo2" {

  availability_zone       = var.availability_zone[1]
  cidr_block              = var.subnet_cdir_block[1]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.demo.id

  tags = map(
    "Name", "eks-nfesta-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_internet_gateway" "demo" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "eks-nfesta"
  }
}

resource "aws_route_table" "demo" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo.id
  }
}

resource "aws_route_table_association" "demo1" {

  subnet_id      = aws_subnet.demo1.id
  route_table_id = aws_route_table.demo.id

}

resource "aws_route_table_association" "demo2" {

  subnet_id      = aws_subnet.demo2.id
  route_table_id = aws_route_table.demo.id

}
