output "public_ip" {
  value = "${aws_elb.example.public_ip}"
}

