variable "vpc_ruth" { 
  description = "My first VPC" 
} 
variable "cidr_block" { 
  description = "CIDR block for the VPC" 
} 

resource "aws_vpc" "main" { 
  cidr_block = var.cidr_block 
  enable_dns_support = true 
  enable_dns_hostnames = true 
  tags = { 
    Name = var.vpc_name 
  } 
} 

resource "aws_internet_gateway" "main" { 
  vpc_id = aws_vpc.main.id 
  tags = { 
    Name = "${var.vpc_ruth}-igw" 
  } 
} 

resource "aws_subnet" "main" { 
  count = 2 
  cidr_block = 
  cidrsubnet(aws_vpc.main.cidr_block, 8, count.index) 
    vpc_id = aws_vpc.main.id 
    availability_zone = "us-east-1a" # Change as needed 
    map_public_ip_on_launch = true 

    tags = { 
      Name = "${var.vpc_name}-subnet-${count.index + 1}" 
    } 
} 

resource "aws_route_table" "main" { 
  vpc_id = aws_vpc.main.id 

  route { 
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.main.id 
  } 
} 

resource "aws_route_table_association" "main" { 
  count = 2 
  subnet_id = aws_subnet.main[count.index].id 
  route_table_id = aws_route_table.main.id 
} 
 
