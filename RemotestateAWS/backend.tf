terraform {
  backend "s3" {
    bucket = "terraprac"
    key    = "terraprac/backend"
    region = "us-east-2"
  }
}
