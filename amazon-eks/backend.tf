terraform {
  backend "s3" {
    bucket         = "burger-box-tf-backend-amazon-eks"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}