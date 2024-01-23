provider "aws" { 
  region = "us-east-1" 
} 
resource "aws_instance" "example" { 
  ami = "ami-for practice" 
  instance_type = "t2.micro" 
spot_price = "0.01" 
tags = { 
Name = "akwesi-instance" 
} 
}
