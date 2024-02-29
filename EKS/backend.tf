terraform {
  backend "s3" {
    bucket = "mytodoappbucket"
    key    = "eks/terraform.tfstate"
    region = "us-east-2"
  }
}