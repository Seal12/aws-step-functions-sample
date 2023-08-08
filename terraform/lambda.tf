
// Create archives for AWS Lambda functions which will be used for Step Function

data "archive_file" "archive-assignCaseFunction" {
  type        = "zip"
  output_path = "../src/assignCaseFunction.zip"
  source_file = "../src/assignCaseFunction.js"
}

data "archive_file" "archive-closeCaseFunction" {
  type        = "zip"
  output_path = "../src/closeCaseFunction.zip"
  source_file = "../src/closeCaseFunction.js"
}

data "archive_file" "archive-escalateCaseFunction" {
  type        = "zip"
  output_path = "../src/escalateCaseFunction.zip"
  source_file = "../src/escalateCaseFunction.js"
}

data "archive_file" "archive-openCaseFunction" {
  type        = "zip"
  output_path = "../src/openCaseFunction.zip"
  source_file = "../src/openCaseFunction.js"
}

data "archive_file" "archive-workOnCaseFunction" {
  type        = "zip"
  output_path = "../src/workOnCaseFunction.zip"
  source_file = "../src/workOnCaseFunction.js"
}

// Create AWS Lambda functions

resource "aws_lambda_function" "assignCaseFunction" {
  filename         = "../src/assignCaseFunction.zip"
  function_name    = "AssignCaseFunction"
  role             = "${aws_iam_role.lambda_basic_execution.arn}"
  handler          = "index.handler"
  runtime          = "nodejs16.x"
}

resource "aws_lambda_function" "closeCaseFunction" {
  filename         = "../src/closeCaseFunction.zip"
  function_name    = "CloseCaseFunction"
  role             = "${aws_iam_role.lambda_basic_execution.arn}"
  handler          = "index.handler"
  runtime          = "nodejs16.x"
}

resource "aws_lambda_function" "escalateCaseFunction" {
  filename         = "../src/escalateCaseFunction.zip"
  function_name    = "EscalateCaseFunction"
  role             = "${aws_iam_role.lambda_basic_execution.arn}"
  handler          = "index.handler"
  runtime          = "nodejs16.x"
}

resource "aws_lambda_function" "openCaseFunction" {
  filename         = "../src/openCaseFunction.zip"
  function_name    = "OpenCaseFunction"
  role             = "${aws_iam_role.lambda_basic_execution.arn}"
  handler          = "index.handler"
  runtime          = "nodejs16.x"
}

resource "aws_lambda_function" "workOnCaseFunction" {
  filename         = "../src/workOnCaseFunction.zip"
  function_name    = "WorkOnCaseFunction"
  role             = "${aws_iam_role.lambda_basic_execution.arn}"
  handler          = "index.handler"
  runtime          = "nodejs16.x"
}
