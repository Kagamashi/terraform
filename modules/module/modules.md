A module in Terraform is a container for multiple resources that are used together. Modules help you organize and reuse Terraform code by encapsulating related resources and configurations into reusable, parameterized units.

Reusability: Modules allow you to abstract common infrastructure patterns and reuse them across different environments (e.g., dev, staging, prod).
Maintainability: Using modules helps reduce code duplication, simplifies large Terraform configurations, and makes the code easier to maintain.
Organization: Modules break complex infrastructure into smaller, manageable components

Example module structure:
my_module/
├── main.tf       # Resource declarations
├── variables.tf  # Input variables
├── outputs.tf    # Output values


Public / Private Modules

Public modules are hosted in the Terraform Registry. 
You can search for modules and reference them in your configurations.
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" # module location in registry
  version = "3.0.0" # specific version of the module

  cidr = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

Private modules are stored in version control repositories like GitHub or any other accessible repository
source points to GitHub repository and ref=v1.0.0 points to specific version
module "vpc" {
  source = "git::https://github.com/myorg/terraform-aws-vpc.git?ref=v1.0.0" 

  cidr_block = "10.0.0.0/16"
}

Relative paths for local modules within the project
module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}
