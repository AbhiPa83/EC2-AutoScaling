terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "ec2-autoscaling/terraform.tfstate"
    region = "ap-south-1"
  }
}