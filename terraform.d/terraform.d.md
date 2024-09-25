## terraform.d
typically located in home directory ~/.terraform.d
- plugins/: Stores downloaded provider binaries for use across all projects.
- credentials.tfrc.json: Stores credentials for accessing private Terraform registries or Terraform Cloud.
- plugin-cache/: Caches provider binaries to speed up initialization.
- .terraformrc: global CLI settings: plugin cache directories, credentials, and proxy settings.
- terraform-plugin-installation.json: Defines alternative installation sources for Terraform providers.

# PLUGINS : plugins
stores provider and provisioner binaries that are used globally across all Terraform configurations

terraform.d/
├── plugins/
│   └── registry.terraform.io/
│       └── hashicorp/
│           └── aws/
│               └── 4.0.0/
│                   └── terraform-provider-aws_v4.0.0_x5
│   └── custom-provider/
│       └── 1.0.0/
│           └── terraform-provider-custom_v1.0.0

# CLI configuration file : credentials.tfrc.json
store credentials for accessing private Terraform registries

{
  "credentials": {
    "app.terraform.io": {
      "token": "your-terraform-cloud-token"
    }
  }
}


# Plugin Cache : plugin-cache
plugin-cache directory inside terraform.d caches plugins to avoid repeadetly downloading providers during terraform init

terraform.d/
├── plugin-cache/
│   └── registry.terraform.io/
│       └── hashicorp/
│           └── aws/
│               └── 4.0.0/

To enable plugin cache add the following to CLI configuration file .terraformrc
plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"


# CLI Configuration : .terraformrc
Customize behavior of CLI 
- proxy settings
- plugin directories
- provider credentials

credentials "app.terraform.io" {
  token = "your-terraform-cloud-token"
}

plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"


# Provider Installation Sources : terraform-plugin-installation.json
Provider installation sources are stored in terraform.d directory and help Terraform determine where to download providers from

{
  "provider_installation": {
    "hashicorp/aws": {
      "source": "registry.terraform.io/hashicorp/aws",
      "version": ">= 3.0.0"
    },
    "mycompany/custom-provider": {
      "source": "local/path/to/custom-provider",
      "version": ">= 1.0.0"
    }
  }
}

