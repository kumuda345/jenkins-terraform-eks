
terraform {
  backend "s3" {
    bucket = "terraform-eks2023"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
