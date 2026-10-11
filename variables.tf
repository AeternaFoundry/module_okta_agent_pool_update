variable "agent_pool_updates" {
  description = <<EOT
Map of agent_pool_updates, attributes below
Required:
    - pool_id
Optional:
    - agent_type
    - description
    - enabled
    - name
    - notify_admins
    - notify_on_completion
    - reason
    - sort_order
    - target_version
    - agents (block):
        - id (optional)
        - pool_id (optional)
    - schedule (block):
        - cron (optional)
        - delay (optional)
        - duration (optional)
        - last_updated (optional)
        - timezone (optional)
EOT

  type = map(object({
    pool_id              = string
    agent_type           = optional(string)
    description          = optional(string)
    enabled              = optional(bool)
    name                 = optional(string)
    notify_admins        = optional(bool)
    notify_on_completion = optional(bool)
    reason               = optional(string)
    sort_order           = optional(number)
    target_version       = optional(string)
    agents = optional(list(object({
      id      = optional(string)
      pool_id = optional(string)
    })))
    schedule = optional(list(object({
      cron         = optional(string)
      delay        = optional(number)
      duration     = optional(number)
      last_updated = optional(string)
      timezone     = optional(string)
    })))
  }))
}

