resource "aws_s3_bucket" "terraform_state" {
  bucket = "garage-flow-terraform-state"
  region = "us-east-2"
}