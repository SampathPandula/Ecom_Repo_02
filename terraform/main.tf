provider "aws" {
  region     = "ap-south-1"  
}
resource "aws_vpc" "ecommerce_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.ecommerce_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"  
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.ecommerce_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"  
  map_public_ip_on_launch = true
}
