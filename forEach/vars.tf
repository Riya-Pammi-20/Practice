variable "REGION" {
  type    = list(string)
  default = ["us-east-1", "us-east-2"]
}

variable "AMIs" {
  type = map(object({
    ami = string
    az  = string
  }))
  default = {
    "us-east-1" = { ami = "ami-0ebfd941bbafe70c6", az = "us-east-1a" }
    "us-east-2" = { ami = "ami-0aa8fc2422063977", az = "us-east-2b" }
  }
}

variable "availability_zone" {
  type    = list(string)
  default = ["us-east-1a", "us-east-2b"]
}
