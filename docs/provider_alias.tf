provider "aws" {
  alias  = "us-west"
  region = "us-west-2"
}

provider "aws" {
  alias  = "us-east"
  region = "us-east-1"
}

# AWS instance in US-West region
resource "aws_instance" "west_instance" {
  provider = aws.us-west
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

# AWS instance in US-East region
resource "aws_instance" "east_instance" {
  provider = aws.us-east
  ami           = "ami-0d4c71e1"
  instance_type = "t2.micro"
}
