variable "REGION"{
    type = list(string)
    default = ["us-east-1", "us-east-2"]
}

variable "AMIs"{
    type = map(string)
    region = var.REGION
    default ={
        "us-east-1" = "ami-0ebfd941bbafe70c6"
        "us-east-2" = "ami-037774efca2da0726"
    }
}

variables "availability_zones"{
    type = list(string)
    default = ["us-east-1a","us-east-2b"]  
}