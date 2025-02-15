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
