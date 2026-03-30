resource "aws_vpc" "proj_vpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "proj_subnet" {
    count = 2
    vpc_id = aws_vpc.proj_vpc.id
    cidr_block = cidrsubnet(var.cidr, 8, count.index)
   # avavailability_zone = element(var.azs, count, index)  
}

resource "aws_internet_gateway" "proj_igw" {
    vpc_id = aws_vpc.proj_vpc.id
}