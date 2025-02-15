


---

## `terraform fmt`
- **Description:** Formats Terraform configuration files to follow the standard style.
- **Usage:**
  ```bash
  terraform fmt
  ```
- **Options:**
  - `-recursive`: Formats files in all subdirectories.

---

## `terraform show`
- **Description:** Displays the current state or details of a saved execution plan.
- **Usage:**
  ```bash
  terraform show
  ```
- **Purpose:** Useful for inspecting the current state or understanding the changes in a plan.

---

## `terraform state`
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

## `terraform import`
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

## `terraform output`
- **Description:** Displays the output values from the state file.
- **Usage:**
  ```bash
  terraform output
  ```
- **Options:**
  - `-json`: Displays the output in JSON format.

---

---

## `terraform graph`
- **Description:** Generates a visual graph of the Terraform configuration.
- **Usage:**
  ```bash
  terraform graph
  ```
- **Tip:** Use tools like Graphviz to render the graph.

---

## `terraform providers`
- **Description:** Lists the providers required by the configuration.
- **Usage:**
  ```bash
  terraform providers
  ```

---

## `terraform version`
- **Description:** Displays the current Terraform version.
- **Usage:**
  ```bash
  terraform version
  ```
