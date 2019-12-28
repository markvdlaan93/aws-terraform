output "terraform_cli_user_id" {
  value = "${aws_iam_access_key.terraform_end_user_key.id}"
}

output "terraform_cli_user_secret" {
  value = "${aws_iam_access_key.terraform_end_user_key.secret}"
}