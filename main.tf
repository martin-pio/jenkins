provider "aws" {
  access_key = "AKIAQ4VZD46FPDEY4MEV"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-0b0ea68c435eb488d"
  # count = "${var.number_of_instances}"
  # subnet_id = "${var.subnet_id}"
  instance_type = "t2.micro"
  subnet_id     = "subnet-050ecd3a5e4a17fad"
  # key_name = "${var.ami_key_pair_name}"
} 

terraform {
  backend "s3" {
    bucket         = "martin-jenkins-bucket-01"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformstatefile"
  }
}

