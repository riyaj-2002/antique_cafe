
output "elb_dns_name" {
  value = module.elb.elb_dns_name
}

output "s3_bucket_name" {
  value = module.s3.s3_bucket_name
  
}