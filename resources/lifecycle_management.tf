# create_before_destroy
# Terraform creates new resource before destroying the old one
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  } # This ensures the new EC2 instance is created first, avoiding downtime.
}


# ignore_changes
# Prevents Terraform from trying to overwrite manual changes
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  lifecycle {
    ignore_changes = [ami]
  } # If AMI is changed manually, Terraform will ignore that change and not attempt to modify it
}


# prevent_destroy
# Avoid accidentaly destroying critical infrastructure
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket"

  lifecycle {
    prevent_destroy = true
  }
}
