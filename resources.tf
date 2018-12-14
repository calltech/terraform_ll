resource "aws_vpc" "vpc_testing" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
      Name = "vpc_testing"
  }
}
resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc_testing.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.vpc_testing.id}"
  availability_zone = "eu-central-1a"
  tags {
      Name = "vpc_testing"
  }
}
