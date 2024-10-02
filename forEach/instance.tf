resource "aws_instance" "demo3" {
  for_each          = var.AMIs
  instance_type     = "t2.micro"
  ami               = each.value.ami
  availability_zone = each.value.az
}
