provider "aws" {
  region= "us-east-1"
}
variable "server_port" {
  description = "Port of incoming traffic"
  default = 8080
}
resource "aws_instance" "foo" {
  ami = "ami-49c9295f"
  instance_type = "t2.micro"
  user_data  = <<-EOF
               #!/bin/bash
               echo "Hello World" > index.html
               nohup busybox httpd -f -p 8080 &
               EOF
  tags {
    Name = "terry"
  }
  security_groups = ["${aws_security_group.web8080.name}"]
}
resource "aws_security_group" "web8080" {
  name = "web8080"
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ip" {
  value = "${aws_instance.foo.public_ip}"
}
