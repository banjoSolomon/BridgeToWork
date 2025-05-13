# terraform {
#   required_version = ">= 1.3.0"
#
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#     kubernetes = {
#       source  = "hashicorp/kubernetes"
#       version = "~> 2.0"
#     }
#   }
#
#   backend "s3" {
#     bucket                      = "todo-tf-state"
#     key                         = "infra/terraform.tfstate"
#     region                      = "us-east-1"
#     endpoint                    = "http://localhost:4566"
#     access_key                  = "test"
#     secret_key                  = "test"
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     skip_requesting_account_id  = true
#     force_path_style            = true
#   }
# }
#
# provider "aws" {
#   region                      = "us-east-1"
#   access_key                  = "test"
#   secret_key                  = "test"
#   skip_credentials_validation = true
#   skip_metadata_api_check     = true
#   skip_requesting_account_id  = true
#
#   endpoints {
#     ec2 = "http://localhost:4566"
#     s3  = "http://localhost:4566"
#     iam = "http://localhost:4566"
#     sts = "http://localhost:4566"
#     eks = "http://localhost:4566"
#   }
# }
#
# provider "kubernetes" {
#   config_path    = "~/.kube/config"
#   config_context = "minikube"
# }
