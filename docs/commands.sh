# terraform init: Initializes a Terraform working directory. It downloads the provider plugins required for your configuration.
terraform init

# terraform plan: Previews the changes Terraform will make to the infrastructure based on the configuration files.
terraform plan

# terraform apply: Applies the changes required to reach the desired state of the configuration. It prompts for confirmation before proceeding.
terraform apply

# terraform destroy: Destroys all resources that were created by Terraform.
terraform destroy 

# terraform state: Allows inspection and modification of the Terraform state.
terraform state

# terraform refresh: Refreshes the state file to reflect the actual state of resources.
terrafom refresh

terraform console

# Note: tf_out.log is ignored by git and will not be commited even if exist.
# [T]erra[F]orm [P]lan
alias tfp='terraform plan -lock=false | tee tf_out.log && sed -n "/^Terraform will perform the following actions/,//p" tf_out.log | awk -F " " "/^\x1B\x5B\x31\x6D  # /{print \$0}"'
# [T]erra[F]orm [P]lan [F]AST
alias tfpf='terraform plan -lock=false -refresh=false | tee tf_out.log && sed -n "/^Terraform will perform the following actions/,//p" tf_out.log | awk -F " " "/^\x1B\x5B\x31\x6D  # /{print \$0}"'

# [T]erra[F]orm [P]lan [S]ummary - will just print the summary from tf_out.log without invoking plan itself
alias tfps='sed -n "/^Terraform will perform the following actions/,//p" tf_out.log | awk -F " " "/^\x1B\x5B\x31\x6D  # /{print \$0}"'

alias tfv='terraform validate'




#!/bin/bash
# Utility script to quickly import role assignments into terraform

users=(\
  put_emails_here \
)

tf_id_prefix='put_here_the_terraform_prefix' # the thing before square brackets in tf plan output
roleName="Virtual Machine User Login"
scope='put_resource_id_here'

for u in "${users[@]}"; do
  echo "Processing: ${u}"
  assignment_id=$(az role assignment list --scope "${scope}" --role "${roleName}" --assignee "${u}" --query '[].id' -o tsv)
  terraform import "${tf_id_prefix}[\"${u}\"]" "${assignment_id}"
done
