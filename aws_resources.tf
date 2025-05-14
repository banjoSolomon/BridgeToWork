#aws_resources.tf
resource "aws_vpc" "todo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "todo-vpc"
  }
}



resource "aws_iam_role" "todo_app_role" {
  name = "todo-app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}
