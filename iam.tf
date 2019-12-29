data "aws_iam_policy_document" "firehose_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "firehose_role" {
  name               = "firehose_role"
  assume_role_policy = "${data.aws_iam_policy_document.firehose_assume_role_policy.json}"
}