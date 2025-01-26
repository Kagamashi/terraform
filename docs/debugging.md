## **Terraform Console**
The `terraform console` provides an interactive environment to query and evaluate expressions, test variables, and inspect resource attributes. It is useful for debugging and understanding how Terraform processes configurations.

### Examples:
```hcl
> aws_instance.example.public_ip
"34.229.119.83"

> var.instance_type
"t2.micro"

> var.environment == "prod" ? "t3.large" : "t2.micro"
"t2.micro"

> data.aws_ami.example.id
"ami-0c55b159cbfafe1f0"

> output.vpc_id
"vpc-12345678"
```

### Exit the Console:
- Type `exit` or press `CTRL+D`.

---

## **TF_LOG Environment Variable**
The `TF_LOG` environment variable enables detailed logging of Terraform operations for debugging purposes. 

### Log Levels:
- **TRACE**: The most detailed logging. Includes all API calls, variable evaluations, and internal processes.
- **DEBUG**: Detailed logging of internal decisions, including state and resource management.
- **INFO**: General information about Terraform’s actions.
- **WARN**: Warnings about potential issues in the configuration or environment.
- **ERROR**: Only logs error messages.

### Usage:
```bash
# Enable DEBUG logging
export TF_LOG=DEBUG

# Redirect logs to a file
export TF_LOG_PATH="terraform-debug.log"

# Run a Terraform command
terraform apply

# Disable logging
unset TF_LOG
```

---

## Resolving State Issues

### 1. **State Locking**
If a state becomes locked, use the following command to unlock it:
```bash
terraform force-unlock <LOCK_ID>
```

### 2. **Drift**
- To update the state file with the current infrastructure:
  ```bash
  terraform refresh
  ```
- To remove resources from the state file that no longer exist:
  ```bash
  terraform state rm <RESOURCE_NAME>
  ```

### 3. **Importing Resources**
Manually created resources can be added to Terraform's state file using the `terraform import` command:
```bash
terraform import <RESOURCE_TYPE.RESOURCE_NAME> <RESOURCE_ID>
```

Example:
```bash
terraform import aws_instance.example i-1234567890abcdef0
```

This ensures the manually created resource is managed by Terraform moving forward.

---
