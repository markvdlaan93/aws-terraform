resource "aws_kinesis_stream" "test_input_stream" {
    name                = "test_input_stream"
    shard_count         = 1
    retention_period    = 24

    shard_level_metrics = [
        "IncomingBytes",
        "OutgoingBytes",
    ]

    tags = {
        Environment = "test"
    }
}

resource "aws_kinesis_stream" "test_output_stream" {
    name                = "test_output_stream"
    shard_count         = 1
    retention_period    = 24

    shard_level_metrics = [
        "IncomingBytes",
        "OutgoingBytes",
    ]

    tags = {
        Environment = "test"
    }
}

resource "aws_kinesis_firehose_delivery_stream" "test_stream" {
    name        = "kinesis-firehose-test-stream"
    destination = "s3"

    kinesis_source_configuration {
        kinesis_stream_arn = "${aws_kinesis_stream.test_input_stream.arn}",
        role_arn           = "${aws_iam_role.firehose_role.arn}"
    }

    s3_configuration {
        role_arn   = "${aws_iam_role.firehose_role.arn}"
        bucket_arn = "${aws_s3_bucket.mvdlaan93_stream_test.arn}"

        cloudwatch_logging_options {
            log_group_name  = "${aws_cloudwatch_log_group.kinesis_firehose_log_group.name}"
            log_stream_name = "${aws_cloudwatch_log_stream.kinesis_firehose_log_stream.name}"
        }
    }
}