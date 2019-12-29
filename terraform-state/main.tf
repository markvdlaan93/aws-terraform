provider "aws" {
    access_key  = "${var.aws_ec2_access_key_iam_user}"
    secret_key  = "${var.aws_ec2_secret_key_iam_user}"
    region      = "${var.aws_region}"
    version     = "~> 2.0"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "mvdlaan93-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}