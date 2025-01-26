/* VARIABLE precedence (from highest to lowest_))
[1] Command-line flags: variables passed using -var flag 
    terraform apply -var="region=us-east-1" -var="instance_type=t2.small"
[2] Explicit variable files: passed using -var-file flag
    terraform apply -var-file="prod.tfvars"
[3] terraform.tfvars or *.auto.tfvars files 
    These files are automatically loaded by Terraform
    These files are processed in lexical order of their filenames
      region = "us-west-2"
      instance_type = "t2.micro"
[4] Environment variables: prefixed with TF_VAR_
    export TF_VAR_region="us-west-2"
[5] Default values in variable declarations */

variable "example" {
  type  = string  # string || number || bool || list(type) || map(type) || object
  default = "value"
  description = "Description of the variable"
  nullable = false  # defines whether the variable can accept null as a valid value.
  sensitive =  true # hides the value of the variable in logs
  validation {
    condition = can(regex("^[a-zA-Z0-9]*$", var.example))
    error_message = "The variable must contain only alphanumeric characters"
  }
  # validation {
  #   condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpc_cidr))
  #   error_message = "Validates CIDR format"
  # }
}


# LIST: a collection of values (similar to an array)
# each element can be accessed by its index: instance_type = var.instance_types[0]
variable "vm_sizes" {
  type    = list(string)
  default = ["Standard_B1s", "Standard_B2s"]  # List of Azure VM sizes
}


# MAP: collection of key-value pairs (similar to a dictionary)
# each element can be acess by its key: ami = var.amis["us-west-1"]
variable "vm_sizes" {
  type = map(string)
  default = {
    "eastus"    = "Standard_B1s"
    "westus"    = "Standard_B2s"
    "centralus" = "Standard_B2ms"
  }
}
