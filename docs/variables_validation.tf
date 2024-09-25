/* 
condition: Defines the rule that the variable value must meet.
error_message: Custom message displayed when the validation fails.

Common Functions:
  contains(): Ensures a value is in a list or map.
  regex(): Validates a string matches a regular expression.
  length(): Ensures a list or string has a certain length.
  can(): Safely evaluates an expression without causing errors.
  alltrue(): Ensures that all conditions in a list are true.
  keys(): Extracts keys from a map. */

# Ensuring a String Follows a Specific Pattern (Regex validation)
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpc_cidr))
    error_message = "The VPC CIDR must be a valid CIDR notation (e.g., 10.0.0.0/16)."
  }
}

# Ensuring a value is within a list of accepted values
variable "environment" {
  type        = string
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

# Validating numeric ranges
variable "instance_count" {
  type        = number
  description = "The number of EC2 instances to launch"

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "Instance count must be between 1 and 10."
  }
}

# Ensuring a list has a minimum number of elements
variable "allowed_ips" {
  type        = list(string)
  description = "List of allowed IP addresses"
  
  validation {
    condition     = length(var.allowed_ips) >= 1
    error_message = "At least one IP address must be provided."
  }
}

# Ensuring a value is a valid boolean
variable "enable_monitoring" {
  type        = bool
  description = "Whether to enable detailed monitoring on the instance"
  
  validation {
    condition     = var.enable_monitoring == true || var.enable_monitoring == false
    error_message = "Monitoring must be either true or false."
  }
}

# Validating a map has specific keys
variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  
  validation {
    condition     = alltrue([contains(keys(var.tags), "Name"), contains(keys(var.tags), "Environment")])
    error_message = "The 'tags' map must contain both 'Name' and 'Environment' keys."
  }
}
/* keys() function extracts keys from the tags map
contains() function checks if the required keys (Name and Environment) are present
alltrue() functions ensures all conditions are met */

# validating a complex object
variable "autoscaling_config" {
  type = object({
    min_size = number
    max_size = number
    desired_capacity = number
  })
  
  validation {
    condition     = var.autoscaling_config.min_size <= var.autoscaling_config.desired_capacity && var.autoscaling_config.desired_capacity <= var.autoscaling_config.max_size
    error_message = "Desired capacity must be between min_size and max_size."
  }
}
# validation ensures that desired_capacity is within min_size and max_size bounds
