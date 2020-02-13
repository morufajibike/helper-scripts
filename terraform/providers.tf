#
# Provider Configuration
#

provider "aws" {
  region  = "us-east-1"
  profile = "cloud_sandbox"
  version = ">= 2.38.0"
}
