resource "aws_instance" "count" {
  count             = 3
  instance_type     = "t2.micro"
  availability_zone = var.av_zones
  ami               = local.ami_list[count.index]
  tags = {
    Name = local.tag_list[count.index]
  }
}
