resource "okta_agent_pool_update" "agent_pool_updates" {
  for_each = var.agent_pool_updates

  pool_id              = each.value.pool_id
  agent_type           = each.value.agent_type
  description          = each.value.description
  enabled              = each.value.enabled
  name                 = each.value.name
  notify_admins        = each.value.notify_admins
  notify_on_completion = each.value.notify_on_completion
  reason               = each.value.reason
  sort_order           = each.value.sort_order
  target_version       = each.value.target_version

  dynamic "agents" {
    for_each = each.value.agents != null ? each.value.agents : []
    content {
      id      = agents.value.id
      pool_id = agents.value.pool_id
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      cron         = schedule.value.cron
      delay        = schedule.value.delay
      duration     = schedule.value.duration
      last_updated = schedule.value.last_updated
      timezone     = schedule.value.timezone
    }
  }
}

