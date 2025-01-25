# Loop over a list and output a map
# {for <ITEM> in <LIST> : <OUTPUT_KEY> => <OUTPUT_VALUE>}

# Loop over a map and output a map
# {for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>}

# Loop over a list to produce a transformed list
# [for <ITEM> in <LIST> : <OUTPUT>]
#   - LIST: A list to loop over
#   - ITEM: Local variable name assigned to each item in LIST
#   - OUTPUT: Expression that transforms ITEM in some way

# A "for" expression creates a complex type value by transforming another complex type value.

# Example: Transform a list of instance types to uppercase
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

output "uppercase_instance_types" {
  value = [for instance in var.instance_types : upper(instance)]  # Transform to uppercase
}

# Example: Filter elements with a condition
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t3.medium"]
}

output "filtered_instance_types" {
  value = [for instance in var.instance_types : instance if instance != "t2.small"]
}
