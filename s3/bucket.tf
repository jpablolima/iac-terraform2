resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket-remote-state"

  versioning {
    enabled = true
  }
}
