 main.tf

provider "aws" {
  region = "us-west-2"  
}

module "my_vpc" {
  source     = "terraform-aws-modules/vpc/aws"
  version    = "2.81.0"  

  name        = "my-vpc"
  cidr        = "10.0.0.0/16"
  azs         = ["us-west-2a", "us-west-2b", "us-west-2c"]

}

output "vpc_id" {
  value = module.my_vpc.vpc_id
}
