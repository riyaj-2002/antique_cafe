variable "project_name"{}
variable "key_pair_name" {}
variable "client_sg_id" {}
variable "cpu" {
    default = "t2.micro"
  
}
variable "max_size" {
    default = 6
}
variable "min_size" {
    default = 2
}
variable "desired_cap" {
    default = 3
}
variable "asg_health_check_type" {
    default = "ELB"
}
variable "private_subnet_1_id" {}
variable "private_subnet_3_id" {}
variable "elb_name" {}