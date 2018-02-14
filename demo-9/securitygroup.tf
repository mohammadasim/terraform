resource "aws_security_group" "allow-ssh" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
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
    Name = "allow-ssh"
  }
}


resource "aws_security_group" "allow-vpc-traffic" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-vpc-traffic"
  description = "security group that allows all vpc traffic"
  ingress {
      from_port = 1
      to_port   = 65535
      protocol  = "tcp"
      cidr_blocks = ["10.10.0.0/16"]
  }

tags {
    Name = "allow-vpc-traffic"
}
}