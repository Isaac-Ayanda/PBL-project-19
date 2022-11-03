# terraform {
#   backend "s3" {
#     bucket         = "isaac-dev-terraform-bucket"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

terraform {
  backend "remote" {
    organization = "mtrone"

    workspaces {
      name = "terraform-pbl-19"
    }
  }
}
