resource "aws_instance" "spot_instance" {
  count = 2

  ami           = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Replace with your desired instance type
  key_name      = "your-key-pair-name"  # Replace with your key pair name
  tags = {
    Name = "SpotInstance-${count.index + 1}"
  }
}
