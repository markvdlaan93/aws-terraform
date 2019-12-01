# resource "aws_instance" "example" {
#     ami = "${var.aws_ami_ubuntu_server_16_04_lts}"
#     instance_type = "t2.micro"
#     tags {
#         Name = "example"
#     }
# }