### CODE STRUCTURE
1. Directory structure
root/
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── dev/
│   └── main.tf
│   └── variables.tf
│   └── terraform.tfvars
└── prod/
    └── main.tf
    └── variables.tf
    └── terraform.tfvars


2. Logical separation of concers like networking, compute resources, storage in separate modules/files
# network.tf
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# compute.tf
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
}


3. Naming conventions 
  - use clear names
  - often dependant on company politics


### REUSABLE CODE
1. Use modules for reusability

2. Parametrize configuration - avoid hardcoding values

3. Outputs for important informations to make them accessible to other modules or users

4. Use terraform fmt and terraform validate


### VARIABLES 
1. Use .tfvars file for environment specificvalues

2. Remember about variable precedence



### SECURITY
1. Avoid hardcoding secrets
2. Mark variables as sensitive to prevent Terraform from displaying them in CLI output
3. Use secure backends for state files