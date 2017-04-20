provider "aws" {
  region= "us-east-1"
}

resource "aws_instance" "foo" {
  ami = "ami-49c9295f"
  instance_type = "t2.micro"
  tags {
    Name = "terry"
  }
}
