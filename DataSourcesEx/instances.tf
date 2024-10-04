resource "aws_instance" "ds"{
    instance_type = "t2.micro"
    ami = data.aws_ami.latest_amazon_linux.id
    availability_zone = var.availability_zone
}