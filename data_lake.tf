 resource "aws_s3_bucket" "example" {
   bucket = "bimmy-tf-test-bucket"
 }

 module "firstmodule" {
   source = "./module/s3"
   bucket_name = "bimmy-module-bucket" }
