State files shouldn't be stored in Git for obvious reasons

.gitignore file should include
*.tfstate
*.tfstate.backup
.terraform/



git tag -a v1.0.0 -m "Initial release of VPC module"
git push origin v1.0.0

module "vpc" {
  source  = "git::https://github.com/myorg/terraform-modules.git//vpc?ref=v1.0.0"
}



# GitOps Worklow
1. Write Terraform Code: Developers create or modify infrastructure code in their local Git repository and push changes to the remote Git repository.

2. Create Pull Request: Before changes are applied to production, the developer creates a pull request (PR) to merge the changes into the main branch (or environment-specific branch).

3. Automated CI/CD Pipeline: A CI/CD pipeline is triggered by the PR to:
    Validate Terraform code with terraform validate.
    Plan infrastructure changes with terraform plan.
    Ensure compliance and security with tools like tflint or checkov.

4. Approval and Merge: Once the changes are reviewed and approved, the PR is merged. This triggers the next step in the GitOps pipeline.

5. Automated Apply: After the merge, the pipeline automatically runs terraform apply to apply the infrastructure changes. The infrastructure is now in sync with the code in Git.
    b. CI/CD Integration for GitOps
    Use CI/CD tools like GitHub Actions, GitLab CI, CircleCI, or Jenkins to automate the Terraform lifecycle.

# Example workflow in GitHub Actions
name: Terraform

on:
  pull_request:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v1

    - name: Terraform Init
      run: terraform init

    - name: Terraform Plan
      run: terraform plan
