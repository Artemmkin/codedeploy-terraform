output bucket_name {
  value = "${aws_s3_bucket.b.bucket_domain_name}"
}

output instance_ip {
  value = "${aws_instance.main.public_ip}"
}
