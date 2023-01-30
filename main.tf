# ####### Only Credentials Starts ####
provider "aws" {
  access_key = "AKIAQ4VZD46FFSTSKCGJ"
  secret_key = "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"
  region     = "us-east-1"
}

# ####### Only Credentials Ends  ####

# ####### EC2 Creatio Starts ####
resource "aws_instance" "ec2_instance" {
  ami = "ami-0b0ea68c435eb488d"
  # count = "${var.number_of_instances}"
  subnet_id = "subnet-050ecd3a5e4a17fad"
  instance_type = "t2.micro"
  # key_name = "${var.ami_key_pair_name}"
}
####### EC2 Creatio Ends ####


terraform {
  backend "s3" {
    bucket         = "martin-jenkins-bucket-01"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformstatefile_01"
  }
}
