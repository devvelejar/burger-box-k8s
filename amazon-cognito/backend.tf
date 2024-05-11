terraform {
  backend "s3" {
    bucket         = "burger-box-amazon-cognito"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

