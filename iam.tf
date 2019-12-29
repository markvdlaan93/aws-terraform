data "aws_iam_policy_document" "firehose_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "firehose_role_policy_document" {
  statement {
    effect  = "Allow"
    actions = [
      "kinesis:*",
    ]

    resources = [
      "${aws_kinesis_stream.test_input_stream.arn}",
      "${aws_kinesis_stream.test_output_stream.arn}",
    ]
  }
}

resource "aws_iam_policy" "firehose_policy" {
  name    = "firehose_policy"
  policy  = "${data.aws_iam_policy_document.firehose_role_policy_document.json}" 
}

resource "aws_iam_role_policy_attachment" "firehose_policy_attachment" {
  role       = "${aws_iam_role.firehose_role.name}"
  policy_arn = "${aws_iam_policy.firehose_policy.arn}"
}

resource "aws_iam_role" "firehose_role" {
  name               = "firehose_role"
  assume_role_policy = "${data.aws_iam_policy_document.firehose_assume_role_policy.json}"
}