#bucket_name
bucket_name = "tf-s3bucket-11.12" 

#bucket_pri_acl = "private"  

bucket_tags = {
    Name        = "My S3 bucket"
    Environment = "Dev"
}

object_key = "images/nature.jpg"

object_source = "/Users/alexandras/Desktop/nature.jpg"


object_pub_acl = "public-read" 

versioning = "Enabled"