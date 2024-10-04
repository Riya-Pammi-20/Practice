#The following example retrieves the latest Amazon Linux AMI from AWS based on specific criteria:

data "aws_ami" "latest_amazon_linux"{
    most_recent = true
    owners = ["amazon"]
    region = "us-east-2"


    filter{
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

    filter{
        name = "virtualization-type"
        values = ["hvm"]
    }
}