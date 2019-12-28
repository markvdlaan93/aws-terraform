resource "aws_kinesis_stream" "test_stream" {
    name                = "test_stream"
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