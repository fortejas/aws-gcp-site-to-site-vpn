variable "aws_credentials_file_path" {
  type = string
  description = "The location of the credentials for AWS"
}

variable "aws_region" {
  type = string
  description = "The region where the AWS VPC is located"
}

variable "aws_vpc_id" {
  type = string
  description = "The VPC ID to connect the VPN to eg: vpc-0ac1215a9fd3bf53a"
}
