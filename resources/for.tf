# Loop over a list and output a map 
{for <ITEM> in <LIST> : <OUTPUT_KEY> => <OUTPUT_VALUE>} 
  
# Loop over a map and output a map 
{for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>} 


[for <ITEM> in <LIST> : <OUTPUT>] 
	• LIST - a list to loop over 
	• ITEM - local variable name to assign to each item in LIST 
OUTPUT - expression that transforms ITEM in some way 

# For expression creates a complex type value by transforming another complex type value

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

output "uppercase_instance_types" {
  value = [for instance in var.instance_types : upper(instance)]  # Transform to uppercase
}



# Filtering elements with condition
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t3.medium"]
}

output "filtered_instance_types" {
  value = [for instance in var.instance_types : instance if instance != "t2.small"]
}
