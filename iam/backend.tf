# Backend configurations can't be interpolated by variables. Therefore, use hardcoded stringss
terraform {
  backend "s3" {
    bucket          = "mvdlaan93-tfstate"
    key             = "states/iam_terraform.tfstate"
    region          = "eu-west-1"
  }
}