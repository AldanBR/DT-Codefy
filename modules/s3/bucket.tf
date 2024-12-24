resource "aws_s3_bucket" "example" {
  bucket = "DT-Alefe-Bucket"

  tags = {
    Name = var.tagging_name
    
  }
}