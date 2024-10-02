terraform {
  backend local {}
}

# simulates creation of multiple Azure Container Registry private endpoints
variable endpoints {
  type = map
  default = {
    "registry" = {
      custom_dns_configs = [
        {
          fqdn = "something.westeurope.data.azurecr.io"
          ip_addresses = ["1.1.1.1",]
        },
        {
          fqdn         = "something.azurecr.io"
          ip_addresses = ["1.1.1.2",]
        }
      ]
    },
    "registry2" = {
      custom_dns_configs = [
        {
          fqdn = "something.westeurope.data.azurecr.io"
          ip_addresses = ["1.1.2.1",]
        },
        {
          fqdn = "something.azurecr.io"
          ip_addresses = ["1.1.2.2",]
        },
      ]
    },
    #...
    # "registryN" = {...}
  }
}

# Question: How to write for block here to get out of it exactly what's in expected
#           result having in mind that there can be multiple of "registry" blocks?
output result {
  value = {for k,v in { 
      for cdc in flatten(
        [for pe in var.endpoints: pe.custom_dns_configs]
      ): 
        cdc.fqdn => cdc.ip_addresses...
    }: 
      k => flatten(v)
  }
}

# Expected result:
# result = {
#   "something.westeurope.data.azurecr.io" = [
#     "1.1.1.1",
#     "1.1.2.1",
#   ]
#   "something.azurecr.io" = [
#     "1.1.1.2",
#     "1.1.2.2",
#   ]
# }