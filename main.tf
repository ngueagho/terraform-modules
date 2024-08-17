# terraform {
#   backend "s3" {
#     bucket          = "examplebucket1"
#     key             = "tfkey/terraform.tfstate"
#     region          = "us-east-1"

#     endpoints = {
#       s3     = "http://localhost:4566"
#     }        
#     sts_endpoint    = "http://localhost:4566"
#   }
# }


provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
    waf            = "http://localhost:4566"
    cloudfront     = "http://localhost:4566"
    acm            = "http://localhost:4566"
    shield         = "http://localhost:4566"
    wafv2          = "http://localhost:4566"
    wafregional    = "http://localhost:4566"
  }
}

module "ec2" {
  source = "./modules/ec2"
  network_interface_id_1 = module.vpc.network_interface_id_1
  network_interface_id_2 = module.vpc.network_interface_id_2
}

module "lb" {
  source = "./modules/lb"
}

module "vpc" {
  source = "./modules/vpc"
}

# resource "aws_s3_bucket" "example" {
#   bucket = "backend"
#   object_lock_enabled = "true"
  
#   tags = {
#     Name        = "backend"
#     Environment = "Dev"
#   }
# }

