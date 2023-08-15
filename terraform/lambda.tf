
// Create archives for AWS Lambda functions which will be used for Step Function

data "archive_file" "archive-assignCaseFunction" {
  type        = "zip"
  output_path = "../build/assignCaseFunction.zip"
  source_file = "../src/assignCaseFunction.js"
}

data "archive_file" "archive-closeCaseFunction" {
  type        = "zip"
  output_path = "../build/closeCaseFunction.zip"
  source_file = "../src/closeCaseFunction.js"
}

data "archive_file" "archive-escalateCaseFunction" {
  type        = "zip"
  output_path = "../build/escalateCaseFunction.zip"
  source_file = "../src/escalateCaseFunction.js"
}

data "archive_file" "archive-openCaseFunction" {
  type        = "zip"
  output_path = "../build/openCaseFunction.zip"
  source_file = "../src/openCaseFunction.js"
}

data "archive_file" "archive-workOnCaseFunction" {
  type        = "zip"
  output_path = "../build/workOnCaseFunction.zip"
  source_file = "../src/workOnCaseFunction.js"
}

// Create AWS Lambda functions

resource "aws_lambda_function" "assignCaseFunction" {
  filename      = "../build/assignCaseFunction.zip"
  function_name = "AssignCaseFunction"
  role          = aws_iam_role.lambda_basic_execution.arn
  handler       = "assignCaseFunction.handler"
  runtime       = "nodejs18.x"
}

resource "aws_lambda_function" "closeCaseFunction" {
  filename      = "../build/closeCaseFunction.zip"
  function_name = "CloseCaseFunction"
  role          = aws_iam_role.lambda_basic_execution.arn
  handler       = "closeCaseFunction.handler"
  runtime       = "nodejs18.x"
}

resource "aws_lambda_function" "escalateCaseFunction" {
  filename      = "../build/escalateCaseFunction.zip"
  function_name = "EscalateCaseFunction"
  role          = aws_iam_role.lambda_basic_execution.arn
  handler       = "escalateCaseFunction.handler"
  runtime       = "nodejs18.x"
}

resource "aws_lambda_function" "openCaseFunction" {
  filename      = "../build/openCaseFunction.zip"
  function_name = "OpenCaseFunction"
  role          = aws_iam_role.lambda_basic_execution.arn
  handler       = "openCaseFunction.handler"
  runtime       = "nodejs18.x"
}

resource "aws_lambda_function" "workOnCaseFunction" {
  filename      = "../build/workOnCaseFunction.zip"
  function_name = "WorkOnCaseFunction"
  role          = aws_iam_role.lambda_basic_execution.arn
  handler       = "workOnCaseFunction.handler"
  runtime       = "nodejs18.x"
}
