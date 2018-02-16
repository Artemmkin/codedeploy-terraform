# create an S3 bucket
resource "aws_s3_bucket" "b" {
  bucket = "codedeploydemo-${random_integer.suffix.result}"
  acl    = "private"
}

resource "random_integer" "suffix" {
  min = 100
  max = 999
}
