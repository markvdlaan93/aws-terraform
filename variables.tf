variable "aws_ec2_access_key" {}
variable "aws_ec2_secret_key" {}
variable "aws_region" {
    default = "eu-west-1"
}
variable "aws_availability_zone" {
    default = "eu-west-1a"
}
variable "aws_profile" {}
variable "aws_account_id" {
    default = "597586409111"
}
variable "aws_ami_ubuntu_server_16_04_lts" {
    default = "ami-0987ee37af7792903"
}
variable "aws_instance_type" {
    default = "t2.micro"
}
variable "aws_cidr_vpc" {
  default = "10.1.0.0/16"
}
variable "aws_cidr_subnet" {
  default = "10.1.0.0/24"
}
variable "aws_environment_tag" {
  default = "production"
}
variable "public_key_path" {
  default = "~/.ssh/id_rsa_aws.pub"
}