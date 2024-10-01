resource "aws_instance" "demo3"{
    for_each = toset(var.REGION)
    region = each.key
    type = "t2.micro"
    ami = var.AMIs[each.key]
    availability_zones = var.availability_zones
}

