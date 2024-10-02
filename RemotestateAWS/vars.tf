variable "REGION" {
  default = "eu-west-1"
}

variable "availability_zones" {
  default = "eu-west-1a"
}

variable "AMIs" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0fed63ea358539e44"
    us-east-1 = "ami-0ebfd941bbafe70c6"
    us-east-2 = "ami-037774efca2da0726"
  }


}

variable "tags" {
  type = map(string)
  default = {
    Name    = "demo2"
    Project = "terra-handson"
  }

}
