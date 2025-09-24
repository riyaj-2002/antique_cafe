
output "elb_dns_name" {
    value = aws_elb.clb.dns_name
  
}

output "elb_name" {
    value = aws_elb.clb.name
}