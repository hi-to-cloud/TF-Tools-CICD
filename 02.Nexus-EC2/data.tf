data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["SolveDevOps-Nexus-Server-Ubuntu20.04-20240511-*"]
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