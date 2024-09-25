/* VARIABLE precedence (from lowest to highest)
[1] Default values in variable declarations
[2] terraform.tfvars or *.auto.tfvars files 
    These files are automatically loaded - example terraform.tfvars file:
      region = "us-west-2"
      instance_type = "t2.micro"
[3] Explicit variable files: passed using -var-file flag
      terraform apply -var-file="prod.tfvars"
[4] Environment variables: prefixed with TF_VAR_
[5] Command-line flags: variables passed using -var flag 
    HIGHEST PRECENCE
      terraform apply -var="region=us-east-1" -var="instance_type=t2.small"

# STRING: single string value
variable "region" {
  type    = string
  default = "us-west-2"
}
# Usage: region = var.region


# LIST: a collection of values (similar to an array)
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small"]
}
# Usage: instance_type = var.instance_types[0]


# MAP: collection of key-value pairs (similar to a dictionary)
variable "amis" {
  type = map(string)
  default = {
    "us-west-1" = "ami-0c55b159cbfafe1f0"
    "us-east-1" = "ami-0d4c71e1"
  }
}
# Usage: ami = var.amis["us-west-1"]


/* Sensitive variable
  - value hidden in TF PLAN/APPLY output
  - it may still appear in terraform.tfstate */
variable "db_password" {
  type      = string
  sensitive = true
}


/* Environment variables
  Usage: Environment variables must follow the pattern TF_VAR_<variable_name>.
  e.g. export TF_VAR_region="us-west-2" */


variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpc_cidr)) # Validates CIDR format
    error_message = "The VPC CIDR must be a valid CIDR notation"
  }
}

/* POSSIBLE FIELDS:
type:
  string: A single string value.
  number: A numeric value (e.g., 1, 2.5).
  bool: A boolean (true or false).
  list(type): A list of values (e.g., list(string) for a list of strings).
  map(type): A map of key-value pairs.
  object: A more complex structure that defines a set of named attributes.

default: Specifies a default value for the variable. If no value is provided at runtime, Terraform will use this value.

description: Provides a human-readable description for the variable. This is useful for documentation and clarifying the purpose of the variable.

nullable: Defines whether the variable can accept null as a valid value.
If nullable = false, Terraform will not accept null values for that variable.

sensitive: If set to true, Terraform will hide the value of the variable in logs, preventing it from being printed during plan/apply operations.
Commonly used for secrets like passwords, API keys, etc.

validation:
Adds custom validation rules to the variable. The condition field specifies the validation logic (usually using functions like contains, can, or regex), and error_message specifies the error message displayed if the validation fails.
*/