# main.tf 

module "my_vpc" { 
  source = "vpc.tf./path/to/your/module" # Update the path accordingly 
  
    vpc_name = "my-vpc" 
    cidr_block = "10.0.0.0/16" # Update with your desired CIDR block }
