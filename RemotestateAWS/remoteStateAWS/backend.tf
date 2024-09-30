terraform{
    backend "stateFilesS3"{
    bucketName = "terraprac"
    key = "terraprac/backend"
    region = "us-east-2"
}
}
