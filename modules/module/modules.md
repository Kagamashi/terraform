# Terraform Modules

A **module** in Terraform is a container for multiple resources that are used together. Modules help you organize and reuse Terraform code by encapsulating related resources and configurations into reusable, parameterized units.

---

## Benefits of Using Modules

### 1. **Reusability**
- Abstract common infrastructure patterns into reusable components.
- Use the same module across different environments (e.g., dev, staging, prod).

### 2. **Maintainability**
- Reduces code duplication.
- Simplifies large Terraform configurations.
- Makes code easier to maintain and update.

### 3. **Organization**
- Breaks complex infrastructure into smaller, manageable components.

---

## Example Module Structure
An example directory structure for a Terraform module:
```
my_module/
├── main.tf       # Resource declarations
├── variables.tf  # Input variables
├── outputs.tf    # Output values
```

---

## Public vs. Private Modules

### **Public Modules**
- Hosted in the [Terraform Registry](https://registry.terraform.io/).
- Can be searched and referenced directly in your configurations.

#### Example:
```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"  # Module location in the registry
  version = "3.0.0"                         # Specific version of the module

  cidr                 = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}
```

---

### **Private Modules**
- Stored in version control repositories like GitHub, GitLab, or Bitbucket.
- Referenced using the `source` attribute pointing to the repository URL.

#### Example:
```hcl
module "vpc" {
  source = "git::https://github.com/myorg/terraform-aws-vpc.git?ref=v1.0.0"  # Points to a specific version

  cidr_block = "10.0.0.0/16"
}
```

---

### **Local Modules**
- Located within the project directory and referenced using relative paths.

#### Example:
```hcl
module "vpc" {
  source = "./modules/vpc"  # Relative path to the local module

  cidr_block = "10.0.0.0/16"
}
```
