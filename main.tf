# Resource block: creates an S3 bucket in the configured AWS region.
resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket-123456" # Must be globally unique across AWS

  tags = {
    Name        = "example-bucket"
    Environment = "dev"
  }
}
