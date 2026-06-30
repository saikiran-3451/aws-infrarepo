# Public subnet: hosts resources that need direct internet access, such as bastion hosts.
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-public"
      Type = "public"
    }
  )
}

# Private subnet: hosts internal resources that should not receive public IPs.
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-private"
      Type = "private"
    }
  )
}
