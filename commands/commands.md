
## 1. `terraform init`
- **Description:** Initializes a Terraform working directory by downloading the necessary provider plugins and setting up the backend for state storage.
- **Usage:**
  ```bash
  terraform init
  ```
- **Options:**
  - `-backend=false`: Disables backend initialization.
  - `-upgrade`: Reinstalls the latest version of provider plugins.

---

## 2. `terraform validate`
- **Description:** Validates the syntax and configuration of Terraform files in the current directory.
- **Usage:**
  ```bash
  terraform validate
  ```
- **Purpose:** Ensures that the configuration is syntactically valid before applying it.

---

## 3. `terraform plan`
- **Description:** Creates an execution plan, showing what actions Terraform will take to achieve the desired state.
- **Usage:**
  ```bash
  terraform plan
  ```
- **Options:**
  - `-out=planfile`: Saves the plan to a file for later execution.
  - `-var 'key=value'`: Sets a variable.

---

## 4. `terraform apply`
- **Description:** Executes the changes defined in the execution plan to reach the desired state.
- **Usage:**
  ```bash
  terraform apply
  ```
- **Options:**
  - `-auto-approve`: Skips the approval prompt.
  - `-var 'key=value'`: Sets a variable.
  - `planfile`: Apply a previously saved plan file.

---

## 5. `terraform destroy`
- **Description:** Destroys all resources managed by the Terraform configuration.
- **Usage:**
  ```bash
  terraform destroy
  ```
- **Options:**
  - `-auto-approve`: Skips the approval prompt.
  - `-target=resource`: Destroys a specific resource.

---

## 6. `terraform fmt`
- **Description:** Formats Terraform configuration files to follow the standard style.
- **Usage:**
  ```bash
  terraform fmt
  ```
- **Options:**
  - `-recursive`: Formats files in all subdirectories.

---

## 7. `terraform show`
- **Description:** Displays the current state or details of a saved execution plan.
- **Usage:**
  ```bash
  terraform show
  ```
- **Purpose:** Useful for inspecting the current state or understanding the changes in a plan.

---

## 8. `terraform state`
- **Description:** Manages the state file, allowing inspection and modification of resources.
- **Usage:**
  ```bash
  terraform state <subcommand>
  ```
- **Subcommands:**
  - `list`: Lists resources in the state.
  - `show`: Shows details of a specific resource.
  - `rm`: Removes a resource from the state.

---

## 9. `terraform import`
- **Description:** Imports existing infrastructure into Terraform's state file.
- **Usage:**
  ```bash
  terraform import resource.id existing_id
  ```
- **Example:**
  ```bash
  terraform import aws_instance.example i-1234567890abcdef0
  ```

---

## 10. `terraform output`
- **Description:** Displays the output values from the state file.
- **Usage:**
  ```bash
  terraform output
  ```
- **Options:**
  - `-json`: Displays the output in JSON format.

---

## 11. `terraform workspace`
- **Description:** Manages multiple workspaces for environments (e.g., dev, staging, prod).
- **Usage:**
  ```bash
  terraform workspace <subcommand>
  ```
- **Subcommands:**
  - `list`: Lists all workspaces.
  - `show`: Shows the current workspace.
  - `new`: Creates a new workspace.
  - `select`: Switches to another workspace.

---

## 12. `terraform taint`
- **Description:** Marks a resource as tainted, forcing it to be destroyed and recreated during the next `terraform apply`.
- **Usage:**
  ```bash
  terraform taint resource.id
  ```

---

## 13. `terraform untaint`
- **Description:** Removes the tainted mark from a resource.
- **Usage:**
  ```bash
  terraform untaint resource.id
  ```

---

## 14. `terraform graph`
- **Description:** Generates a visual graph of the Terraform configuration.
- **Usage:**
  ```bash
  terraform graph
  ```
- **Tip:** Use tools like Graphviz to render the graph.

---

## 15. `terraform login`
- **Description:** Authenticates Terraform with Terraform Cloud or other remote backends.
- **Usage:**
  ```bash
  terraform login
  ```

---

## 16. `terraform providers`
- **Description:** Lists the providers required by the configuration.
- **Usage:**
  ```bash
  terraform providers
  ```

---

## 17. `terraform version`
- **Description:** Displays the current Terraform version.
- **Usage:**
  ```bash
  terraform version
  ```
