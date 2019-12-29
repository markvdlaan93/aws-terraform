resource "aws_cloudwatch_log_group" "kinesis_firehose_log_group" {
  name = "kinesis_firehose_log_group"

  tags = {
    Environment = "test"
  }
}

resource "aws_cloudwatch_log_stream" "kinesis_firehose_log_stream" {
  name           = "kinesis_firehose_log_stream"
  log_group_name = "${aws_cloudwatch_log_group.kinesis_firehose_log_group.name}"
}