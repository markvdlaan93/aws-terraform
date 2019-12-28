resource "aws_iam_group_membership" "terraform_end_user_group_membership" {
    name = "terraform_end_user_group_membership"

    users = [
        "${aws_iam_user.terraform_end_user.name}",
    ]

    group = "${aws_iam_group.terraform_end_user_group.name}"
}

resource "aws_iam_user" "terraform_end_user" {
    name = "terraform_end_user"
}

resource "aws_iam_access_key" "terraform_end_user_key" {
  user = "${aws_iam_user.terraform_end_user.name}"
}

resource "aws_iam_group" "terraform_end_user_group" {
    name = "terraform_end_user_group"
}

resource "aws_iam_group_policy_attachment" "terraform_end_user_ec2_full_access" {
    group       = "${aws_iam_group.terraform_end_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_end_user_ec2_container_registry_full_access" {
    group       = "${aws_iam_group.terraform_end_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_end_user_s3_full_access" {
    group       = "${aws_iam_group.terraform_end_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_end_user_kinesis_full_access" {
    group       = "${aws_iam_group.terraform_end_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_end_user_dynamo_db_full_access" {
    group       = "${aws_iam_group.terraform_end_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_group_policy_attachment" "terraform_end_user_sns_full_access" {
    group       = "${aws_iam_group.terraform_end_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}