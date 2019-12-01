resource "aws_vpc" "vpc" {
    cidr_block = "${var.aws_cidr_vpc}"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags {
        "Environment" = "${var.aws_environment_tag}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"
    tags {
        "Environment" = "${var.aws_environment_tag}"
    }
}

resource "aws_subnet" "subnet_public" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.aws_cidr_subnet}"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.aws_availability_zone}"
    tags {
        "Environment" = "${var.aws_environment_tag}"
    }
}

resource "aws_route_table" "route_table" {
    vpc_id = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags {
        "Environment" = "${var.aws_environment_tag}"
    }
}

resource "aws_route_table_association" "rta_subnet_public" {
    subnet_id = "${aws_subnet.subnet_public.id}"
    route_table_id = "${aws_route_table.route_table.id}"
}

resource "aws_security_group" "sg_ssh" {
    vpc_id = "${aws_vpc.vpc.id}"
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        "Environment" = "${var.aws_environment_tag}"
    }
}

resource "aws_key_pair" "key_pair" {
    key_name = "publicKey"
    public_key = "${file(var.public_key_path)}"
}