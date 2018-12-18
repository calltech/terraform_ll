resource "aws_vpc" "vpc_testing" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "vpc_testing"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.vpc_testing.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.vpc_testing.id}"
  availability_zone = "eu-central-1a"

  tags {
    Name = "vpc_testing"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block        = "${cidrsubnet(aws_vpc.vpc_testing.cidr_block, 2, 2)}"
  vpc_id            = "${aws_vpc.vpc_testing.id}"
  availability_zone = "eu-central-1b"

  tags {
    Name = "vpc_testing2"
  }
}

resource "aws_subnet" "subnet3" {
  cidr_block        = "10.0.88.0/24"
  vpc_id            = "${aws_vpc.vpc_testing.id}"
  availability_zone = "eu-central-1b"

  tags {
    Name = "vpc_testing3"
  }
}

resource "aws_security_group" "http_in_80" {
  vpc_id = "${aws_vpc.vpc_testing.id}"

  ingress = {
    #fol local access
    #    cidr_blocks = ["${aws_vpc.vpc_testing.cidr_block}"]
    #for internet acess    
    cidr_blocks = ["0.0.0.0/0"]

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  tags {
    Name = "vpc_testing"
  }
}
