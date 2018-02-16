resource "aws_key_pair" "main" {
  key_name   = "code-deploy-demo"
  public_key = "${file(var.public_key_path)}"
}
