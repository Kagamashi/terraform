## **terraform console:** An interactive environment to query and evaluate expressions, test variables, and inspect resource attributes. Use it to debug and understand how Terraform processes configurations.

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

Exit terraform console by typing **exit** or pressing **CTRL+D**



## **TF_LOG **environment variable: Enables detailed logging of Terraform operations for debugging purposes. Log levels include TRACE, DEBUG, INFO, WARN, and ERROR. Logs can be redirected to a file using **TF_LOG_PATH.**

The TF_LOG environment variable can be set to different levels of verbosity:
- TRACE: The most detailed logging. Includes all API calls, variable evaluations, and internal processes.
- DEBUG: Detailed logging of internal decisions, including state and resource management.
- INFO: General information about Terraform’s actions.
- WARN: Warnings about potential issues in the configuration or environment.
- ERROR: Only logs error messages.

> export TF_LOG=DEBUG
> export TF_LOG_PATH="terraform-debug.log"
> terraform apply

> unset TF_LOG


## Resolving State Issues:
- State Locking: Use **terraform force-unlock** to resolve stuck state locks.
- Drift: Use **terraform refresh** to update the state or **terraform state rm** to remove resources that no longer exist.
- Importing Resources: Use **terraform import** to add manually created resources to the Terraform state.