resource "aws_s3_bucket" "mvdlaan93_stream_test" {
  bucket = "mvdlaan93-stream-test"
  acl    = "private"

  versioning {
    enabled = true
  }
}