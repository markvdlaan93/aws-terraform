provider "aws" {
    access_key  = "${var.aws_ec2_access_key_end_user}"
    secret_key  = "${var.aws_ec2_secret_key_end_user}"
    region      = "${var.aws_region}"
    profile     = "${var.aws_profile}"
    version     = "~> 2.0"
}