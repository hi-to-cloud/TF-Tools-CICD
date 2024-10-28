module "nexus-made-easy" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.common_tags.Project}-${var.common_tags.Environment}-${var.common_tags.Component}"
  ami  = data.aws_ami.ami_id.id

  instance_type               = "t3.medium"
  key_name                    = "vpn-001"
  monitoring                  = true
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0b7da04e1e4d11c94"]
  subnet_id                   = "subnet-0bb75fcf37600c98c"
  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 30
    }
  ]
  tags = merge(
    var.common_tags,
    {
      Name = "${var.common_tags.Project}-${var.common_tags.Environment}-${var.common_tags.Component}",
    }
  )
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name = "nexus"
      type = "A"
      ttl  = 1
      records = [
        module.nexus-made-easy.public_ip
      ]
    },
    {
      name = "nexus-private"
      type = "A"
      ttl  = 1
      records = [
        module.nexus-made-easy.private_ip
      ]
    }
  ]
}