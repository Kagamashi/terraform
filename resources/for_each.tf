
# for_each allows you to create resources for each item in a map or set. 
# It’s more flexible than count as it allows the creation of resources based on key-value pairs.
resource "aws_instance" "my_instance" {
  for_each = {
    server1 = "ami-0c55b159cbfafe1f0"
    server2 = "ami-0d4c71e1"
  }

  ami           = each.value // different names (server1 and server2)
  instance_type = "t2.micro"
  tags = {
    Name = each.key // different AMIs
  }
}


# using for_each with a list
variable "instance_names" {
  type    = list(string)
  default = ["web", "app", "db"]
}

resource "aws_instance" "example" {
  for_each     = toset(var.instance_names)  # Convert the list to a set for iteration
  ami          = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  tags = {
    Name = each.key  # Each instance gets a name from the list
  }
}


# using for_each with a map
variable "instance_configs" {
  type = map(string)
  default = {
    "web" = "t2.micro"
    "app" = "t2.small"
    "db"  = "t2.medium"
  }
}

resource "aws_instance" "example" {
  for_each = var.instance_configs
  
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = each.value  # Use the value (instance type) from the map
  tags = {
    Name = each.key  # Use the key (name) from the map
  }
}


# using for_each with resources having unique identifiers
variable "ingress_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = {
    ssh = {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    http = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.ingress_rules  # Create one rule for each map entry
  
  type        = "ingress"
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = each.value.cidr_blocks
  security_group_id = aws_security_group.example.id
}
