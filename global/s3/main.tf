provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-vishnu"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
