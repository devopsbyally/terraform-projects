bucket_name = "tf-s3bucket-11.12"

instance_type = "t2.micro"

ami_id = "ami-0182f373e66f89c85"

instance_tags = {
    Name = "ec2-accessrole-for-s3"
    Environment = "Dev"
}

key_pair_name = "serverkey"