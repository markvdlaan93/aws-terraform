output "terraform_end_user_id" {
  value = "${aws_iam_access_key.terraform_end_user_key.id}"
}

output "terraform_end_user_secret" {
  value = "${aws_iam_access_key.terraform_end_user_key.secret}"
}

output "cli_user_id" {
  value = "${aws_iam_access_key.cli_user_key.id}"
}

output "cli_user_secret" {
  value = "${aws_iam_access_key.cli_user_key.secret}"
}