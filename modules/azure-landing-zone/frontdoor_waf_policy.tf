resource "azurerm_frontdoor_firewall_policy" "custom" {
  count               = length(var.frontends)
  name                = lookup(element(var.frontends, count.index), "name")
  resource_group_name = azurerm_resource_group.main.name
  enabled             = true
  mode                = var.waf_mode

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    dynamic "override" {
      iterator = rulesets
      for_each = lookup(element(var.frontends, count.index), "disabled_rules")

      content {
        rule_group_name = rulesets.key

        dynamic "rule" {
          iterator = rule_id
          for_each = rulesets.value

          content {
            rule_id = rule_id.value
            enabled = false
            action  = "Block"
          }
        }
      }

    }
  }

  managed_rule {
    type    = "BotProtection"
    version = "preview-0.1"
  }
}