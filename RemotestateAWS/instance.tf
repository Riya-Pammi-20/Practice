resource "aws_instance" "demo-instance" {
  ami                    = var.AMIs[var.REGION]
  instance_type          = "t2.micro"
  key_name               = "vpro-cf"
  vpc_security_group_ids = ["sg-0ddd95bca4bdd9533"]
  tags                   = var.tags
  availability_zone      = var.availability_zones

}
