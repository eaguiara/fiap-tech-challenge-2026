resource "aws_vpc" "garage_flow_vpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "garage_flow_subnet_az_a" {
  vpc_id            = aws_vpc.garage_flow_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
}

resource "aws_subnet" "garage_flow_subnet_az_b" {
  vpc_id            = aws_vpc.garage_flow_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"
}