resource "aws_instance" "ruth" { 
  ami = "ami-for practice" 
  instance_type = "t2.micro" 
  spot_price = "0.45" 
  tags = { 
    Name = "akwesi-instance" 
  } 
}
