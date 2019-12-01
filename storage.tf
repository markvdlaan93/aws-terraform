resource "aws_instance" "example" {
    ami = "${var.aws_ami_ubuntu_server_16_04_lts}"
    instance_type = "${var.aws_instance_type}"
    subnet_id = "${aws_subnet.subnet_public.id}"
    vpc_security_group_ids = ["${aws_security_group.sg_ssh.id}"]
    key_name = "${aws_key_pair.key_pair.key_name}"
    tags {
        "Environment" = "${var.aws_environment_tag}"
    }
}

resource "aws_ecr_repository" "ecr_repo_docker" {
  name                 = "ecr_repo_docker"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
