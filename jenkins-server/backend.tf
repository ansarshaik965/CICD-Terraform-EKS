terraform {
  backend "s3" {
    bucket = "mytodoappbucket"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-2"
  }
}