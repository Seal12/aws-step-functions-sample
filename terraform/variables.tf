variable "aws_region" {
  type = string
  description = "Specified AWS Region"
  default = "af-south-1"
}

variable "aws_credential_profile" {
  type = string
  description = "AWS Profile With Admin Access"
  default = "aws_seal"
}

variable "phone_number_for_notification" {
  type = string
  description = "Valid Handphone number for notification"
  default = "0712345678"
}




