resource "aws_iam_group_membership" "cli_user_group_membership" {
    name = "cli_user_group_membership"

    users = [
        "${aws_iam_user.cli_user.name}",
    ]

    group = "${aws_iam_group.cli_user_group.name}"
}

resource "aws_iam_user" "cli_user" {
    name = "cli_user"
}

resource "aws_iam_access_key" "cli_user_key" {
    user = "${aws_iam_user.cli_user.name}"
}

resource "aws_iam_group" "cli_user_group" {
    name = "cli_user_group"
}

resource "aws_iam_group_policy_attachment" "cli_user_ec2_full_access" {
    group       = "${aws_iam_group.cli_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "cli_user_kinesis_full_access" {
    group       = "${aws_iam_group.cli_user_group.name}"
    policy_arn  = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
}