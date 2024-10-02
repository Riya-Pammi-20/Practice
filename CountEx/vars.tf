variable "REGION" {
  default = "ap-south-1"
}

variable "av_zones" {
  default = "ap-south-1a"
}


variable "AMIs" {
  type = map(object({
    tag = string
    ami = string

  }))
  default = {
    "AmazonLinux" = { ami = "ami-08718895af4dfa033", tag = "AmazonLinux" }
    "Ubuntu"      = { ami = "ami-0dee22c13ea7a9a67", tag = "Ubuntu" }
    "RedHat"      = { ami = "ami-022ce6f32988af5fa", tag = "RedHat" }

  }

}

locals {
  ami_list = [
    var.AMIs["AmazonLinux"].ami,
    var.AMIs["Ubuntu"].ami,
    var.AMIs["RedHat"].ami
  ]

  tag_list = [
    var.AMIs["AmazonLinux"].tag,
    var.AMIs["Ubuntu"].tag,
    var.AMIs["RedHat"].tag

  ]
}
