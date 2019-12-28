output "terraform_cli_user" {
  value = "${aws_iam_access_key.terraform_end_user_key.user}"
}

output "terraform_cli_user_key" {
  value = "${aws_iam_access_key.terraform_end_user_key.secret}"
}