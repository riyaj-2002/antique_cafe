
output "vpc_id" {
  value = aws_vpc.vpc.id
  
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  
}

output "private_subnet_ids" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id, aws_subnet.private_subnet_4.id]
  
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
  
}

output "public_rt_id" {
  value = aws_route_table.public_rt.id
}


output "availability_zones" {
  value = data.aws_availability_zones.available.names
  
}

output "region" {
  value = var.aws_region
  
}
