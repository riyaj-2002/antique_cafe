/*
terraform {
  backend "s3" {
    bucket = "antique-cafe-bucket-e39c2b00"
    key    = "backend/antique-cafe.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
    
  }
}
*/