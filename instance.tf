resource "aws_instance" "main" {
  ami                  = "${data.aws_ami.amzn-linux.id}"
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.main.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.main.name}"

  vpc_security_group_ids = [
    "${aws_security_group.http.id}",
    "${aws_security_group.ssh.id}",
    "${aws_security_group.allow_all_outbound.id}",
  ]

  tags {
    Name = "CodeDeployDemo"
  }

  provisioner "remote-exec" {
    script = "./install_codedeploy_agent.sh"

    connection {
      agent       = false
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file(var.private_key_path)}"
    }
  }
}
