# Bastion host: provides secure SSH access to the private network from a public location.
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.bastion_instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  monitoring                  = true

  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-bastion"
      Type = "bastion"
    }
  )
}
