variable "REGION"{
    default = "eu-west-1"
}

variable "av_zones"{
    type = list(string)
    default = ["eu-west-1a" , "eu-west-1b"]
}

variable "tags"{
    type = map(string)
    default = {
        "Name" = "Inst"
    }
}

variable "AMIs"{
    type = list(string)
    default = ["ami-08718895af4dfa033","",""]
}

variable "AMIs"{
    type = map(object({
        tag =  String
        ami = String

    }))
    default = {
    "AmazonLinux" = { ami ="ami-08718895af4dfa033", tag = "AmazonLinux"}
    "Ubuntu" = { ami = "ami-0dee22c13ea7a9a67", tag = "Ubuntu"}
    "RedHat" = { ami = "ami-022ce6f32988af5fa", tag = "RedHat"}

    }
 
}

locals{
    ami_list[ 
        var.AMIs["AmazonLinux"].ami, 
        var.AMIs["Ubuntu"].ami,
        var.AMIs["RedHat"].ami 
        ]

    tag_list[
        var.AMIs["AmazonLinux"].tag,
         var.AMIs["Ubuntu"].tag,
        var.AMIs["RedHat"].tag
        
        ]
}
