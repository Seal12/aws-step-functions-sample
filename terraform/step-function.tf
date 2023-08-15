
// Create state machine for step function
resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "sample-state-machine"
  role_arn = aws_iam_role.step_functions_basic_execution.arn

  definition = jsonencode({
    "Comment" : "A simple AWS Step Functions state machine that automates a call center support session.",
    "StartAt" : "Open Case",
    "States" : {
      "Open Case" : {
        "Type" : "Task",
        "Resource" : "${aws_lambda_function.openCaseFunction.arn}",
        "Next" : "Assign Case"
      },
      "Assign Case" : {
        "Type" : "Task",
        "Resource" : "${aws_lambda_function.assignCaseFunction.arn}",
        "Next" : "Work on Case"
      },
      "Work on Case" : {
        "Type" : "Task",
        "Resource" : "${aws_lambda_function.workOnCaseFunction.arn}",
        "Next" : "Is Case Resolved"
      },
      "Is Case Resolved" : {
        "Type" : "Choice",
        "Choices" : [
          {
            "Variable" : "$.Status",
            "NumericEquals" : 1,
            "Next" : "Close Case"
          },
          {
            "Variable" : "$.Status",
            "NumericEquals" : 0,
            "Next" : "Escalate Case"
          }
        ]
      },
      "Close Case" : {
        "Type" : "Task",
        "Resource" : "${aws_lambda_function.closeCaseFunction.arn}",
        "End" : true
      },
      "Escalate Case" : {
        "Type" : "Task",
        "Resource" : "${aws_lambda_function.escalateCaseFunction.arn}",
        "Next" : "Fail"
      },
      "Fail" : {
        "Type" : "Fail",
        "Cause" : "Engage Tier 2 Support."
      }

    }
  })

  depends_on = [
    aws_lambda_function.openCaseFunction,
    aws_lambda_function.assignCaseFunction,
    aws_lambda_function.workOnCaseFunction,
    aws_lambda_function.closeCaseFunction,
    aws_lambda_function.escalateCaseFunction,
  ]

}




