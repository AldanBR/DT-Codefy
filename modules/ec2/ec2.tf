resource "aws_security_group" "ec2_sg" {
  name = "ec2-security-group"
  description = "Security group for EC2 instance"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.allowed_ssh_ip]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_id

  security_groups = [aws_security_group.ec2_sg.name]

  iam_instance_profile = aws_iam_instance_profile.ec2_role.name

  tags = {
    Name = var.tagging_name
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = { Service = "ec2.amazonaws.com" },
      },
    ],
  })
}

resource "aws_iam_policy" "s3_policy" {
  name        = "S3AccessPolicy"
  description = "Policy to allow EC2 instance access to S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:*"],
        Effect   = "Allow",
        Resource = "arn:aws:s3:::desafio-s3/*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_role" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_s3_bucket" "desafio_bucket" {
  bucket = "desafio-s3"

  versioning {
    enabled = true
  }

  block_public_acls  = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}