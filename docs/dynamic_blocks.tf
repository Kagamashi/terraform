/* DYNAMIC BLOCKS
allows to create multiple instances of a resource block or a nested arguments based on a list or map of inputs.
This reduces code duplication when defining multiple similar resources or attributes. */

resource "aws_security_group" "example" {
  name = "example-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

variable ingress_rules {} 

/* In this example, the ingress rules are defined dynamically using the for_each iterator, pulling values from a variable var.ingress_rules.
    for_each: Iterates over a map or list, generating one block for each item.
    content: Contains the actual attributes and values of the dynamically created block. */



/* DYNAMIC EXPRESSIONS
alow to write conditional logic inside Terraform configuration
These expressions are useful when certain resources or attributes should only be defined based on conditions */ 

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  monitoring = var.environment == "prod" ? true : false
}

variable instance_type {}
variable environment {}

/* Ternary Operator: The format 
condition ? true_value : false_value 
is used to apply conditional logic in Terraform. */
