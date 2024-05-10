terraform {
  backend "s3" {
    bucket         = "burger-box-amazon-api-gateway"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}