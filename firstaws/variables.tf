variable "REGION"{
    default = "eu-west-1"
}

variable "availability_zones"{
    type = list(string)
    default = [ "eu-west-1a", "eu-west-1b" ]
}

variable "AMIs" {
    default = "ami-0fed63ea358539e44"
  
}

variable "tags"{
    type = map(string)
    default ={
        Name    = "demo2"
        Project = "terra-handon"
    }
   
}

