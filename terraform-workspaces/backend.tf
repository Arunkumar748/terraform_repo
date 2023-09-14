/* terraform {
  backend "s3" {
    bucket         = "statefile-bucket-31-08"
    key            = "terraform.tfstate.d/${terraform.workspace}/terraform.tfstate"
    region         = "us-east-1"  # Change to your desired region
    encrypt        = true         # Optional: Set to true for encryption
    #dynamodb_table = "terraform-state-locks"  # Optional: Use DynamoDB for locking
  }
} */

#terraform_repo/terraform-workspaces/terraform.tfstate.d/dev



