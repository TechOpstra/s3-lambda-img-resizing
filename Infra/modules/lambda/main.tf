resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.s3_bucket}/*",
          "arn:aws:s3:::${var.processed_bucket}/*"
        ]
      },
      {
        Action = "sns:Publish"
        Effect = "Allow"
        Resource = var.sns_topic_arn
      }
    ]
  })
}

resource "aws_lambda_function" "image_processor" {
  function_name = var.lambda_function_name
  role = aws_iam_role.lambda_exec_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"
  filename = "lambda.zip"  # Ensure you have the zipped Lambda function code
  source_code_hash = filebase64sha256("lambda.zip")
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.s3_bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.image_processor.arn
    events = ["s3:ObjectCreated:*"]
  }
}

output "lambda_function_name" {
  value = aws_lambda_function.image_processor.function_name
}
