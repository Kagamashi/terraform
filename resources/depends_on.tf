# depends_on explicitly defines a resource's dependency on other resources. 

# This is particularly useful when the dependency is not directly referenced within the resource itself.
# Most of the times Terraform is able to automatically detect the order of dependency

resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  depends_on    = [aws_vpc.my_vpc]
}

# This ensures that the VPC is created before the EC2 instance is launched.

