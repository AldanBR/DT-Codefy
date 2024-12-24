provider "aws"{
    region = var.aws_region

    default_tags {
        tags = {
            owner = "DesafioCodefy(Álefe)"
            managed-by = "terraform"
        }
    }
}