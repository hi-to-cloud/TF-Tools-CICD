data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["SolveDevOps-SonarQube-Server-Ubuntu20.04-20240912-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}