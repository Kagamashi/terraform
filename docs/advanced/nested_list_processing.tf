# environments/thor/prod/01-admin/dns_services.tf

variable zones {
  type = map

  # Map Description:
  # "zone_name from link above" = ["all", "of", "the", "service", "ids", "for", "given", "service"]
  default = {

    # Docker related zones
    "privatelink.westeurope.azmk8s.io" = { # AKS - regional!
      privatelink_names = ["management"]
      records = {
        a = []
        cname = []
      }
    }
    "privatelink.azurecr.io" = {
      privatelink_names = ["registry"] # ACR
      records = {
        a = []
        cname = []
      }
    }
    "privatelink.database.windows.net" = {
      privatelink_names = ["sqlServer"]
      records = {
        a = [
          {name = "sql-swisscat-dev-weur-001", records = ["10.254.93.68"], ttl = 300},
        ]
        cname = [
          #{name = "example", record = "my.example.com", ttl = 300},
        ]
      }
    }
  }
}

resource "azurerm_private_dns_a_record" "privatelink_records" {
  for_each = {for i in flatten([for k,v in var.zones: [for r in v.records.a: {
      name = r.name
      records = r.records
      ttl = r.ttl
      tags = var.tags # every record will use tags from var.tags as in variable block usage of var. prefix is not allowed.
      fqdn = "${r.name}.${k}"
      zone_name = k
    }]
  ]): i.fqdn => i}

  name                = each.value.name
  zone_name           = azurerm_private_dns_zone.zone[each.value.zone_name].name
  resource_group_name = azurerm_private_dns_zone.zone[each.value.zone_name].resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records

  tags                = each.value.tags
}
resource "azurerm_private_dns_cname_record" "privatelink_records" {
  for_each = {for i in flatten([for k,v in var.zones: [for r in v.records.cname: {
      name = r.name
      record = r.record
      ttl = r.ttl
      tags = var.tags # every record will use tags from var.tags as in variable block usage of var. prefix is not allowed.
      fqdn = "${r.name}.${k}"
      zone_name = k
    }]
  ]): i.fqdn => i}

  name                = each.value.name
  zone_name           = azurerm_private_dns_zone.zone[each.value.zone_name].name
  resource_group_name = azurerm_private_dns_zone.zone[each.value.zone_name].resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record

  tags                = each.value.tags
}
