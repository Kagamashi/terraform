
# Note that after you’ve used count on a resource,  
# it becomes an array of resources rather than just one resource.  
# Count on module turns it into an array of modules. 


# count argument allows to create multiple instances of a resource based on the count value.
# useful for scaling up resources without duplicating the code
resource "aws_instance" "my_instance" {
  count         = 3
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}


# creates three EC2 instances with the same configuration.
# each instance can be accessed using an index (e.g., aws_instance.my_instance[0]).
# using count.index to differentiate resources
resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-${count.index + 1}"  # creates tags: Instance-1, Instance-2, Instance-3
  }
}


# conditional resource creation with count (count as if-else statement)
resource "aws_instance" "example" {
  count = var.create_instance ? 1 : 0   # create the instance only if the condition is true
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

variable create_instance {
  type = bool
  default = true
}


# working with lists using count
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

resource "aws_instance" "example" {
  count         = length(var.instance_types)

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_types[count.index]  # use a different instance type for each aws_instance
}
