
### Avoid Storing State Files in Git
Terraform state files often contain sensitive information and should not be stored in version control systems like Git.

### Recommended `.gitignore` Entries:
```plaintext
*.tfstate
*.tfstate.backup
.terraform/
```

---

## Using Git with Terraform Modules
Tagging specific versions of modules and referencing them in Terraform configurations ensures consistency and predictability.

### Tagging a Release in Git:
```bash
git tag -a v1.0.0 -m "Initial release of VPC module"
git push origin v1.0.0
```

### Referencing a Module in Terraform:
```hcl
module "vpc" {
  source  = "git::https://github.com/myorg/terraform-modules.git//vpc?ref=v1.0.0"
}
```

---

## GitOps Workflow with Terraform

### Steps:
1. **Write Terraform Code:** Developers create or modify infrastructure code in their local Git repository and push changes to the remote Git repository.
2. **Create Pull Request:** Before applying changes to production, create a pull request (PR) to merge changes into the main branch (or environment-specific branch).
3. **Automated CI/CD Pipeline:** Triggered by the PR to:
   - Validate Terraform code with `terraform validate`.
   - Plan infrastructure changes with `terraform plan`.
   - Ensure compliance and security with tools like `tflint` or `checkov`.
4. **Approval and Merge:** Once approved, merge the PR, triggering the next step in the pipeline.
5. **Automated Apply:** After the merge, run `terraform apply` automatically to apply the infrastructure changes, ensuring the infrastructure matches the code in Git.

### Example Workflow in GitHub Actions:
```yaml
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
```
