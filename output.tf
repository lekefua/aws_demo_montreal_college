output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
output "main_vpc_id" {
  value = module.my_vpc.vpc_id
}
