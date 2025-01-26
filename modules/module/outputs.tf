# outputs to expose information about the resources created by the module

output "vpc_id" {
  value = aws_vpc.this.id
}
