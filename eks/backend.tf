
terraform {
  backend "s3" {
    bucket = "terraform-eks2023"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
