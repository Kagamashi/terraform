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
