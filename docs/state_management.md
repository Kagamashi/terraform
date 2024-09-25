Terraform State Files: State files track the mapping between Terraform configurations and actual infrastructure. By default, state is stored locally, but it’s better to use remote state for production or collaborative environments.
[!] Sensitive data is stored in state file so it should be secured (encryption, access control etc.)

Remote State Storage: Remote backends like S3, Azure Blob, and Google Cloud Storage centralize state files and improve collaboration. They also support state locking to prevent concurrent updates.
terraform {
  backend "azurerm" {
    storage_account_name = "mystorageaccount"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}


State Locking and Consistency: State locking ensures that multiple Terraform runs don’t cause conflicts. Remote backends like S3 with DynamoDB or Azure Blob Storage handle locking automatically.
Supported Backends with State Locking:
S3 with DynamoDB (locking via DynamoDB).
Azure Blob Storage (locking built-in).
Google Cloud Storage (GCS) (with built-in locking).
HashiCorp Consul (provides both storage and locking).
Terraform Cloud (built-in state storage and locking).

Importing Resources into State: The terraform import command allows you to bring existing infrastructure under Terraform management by associating resources with state files.
[!] terraform import doesnt update .tf files automatically; it only updates state file
Configuration needs to be updated manully after the import