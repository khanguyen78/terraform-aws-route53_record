variable "zone_id" {
  description = "The Route53 Hosted Zone ID."
  type        = string
}

variable "record_name" {
  description = "The name of the record."
  type        = string
}

variable "record_type" {
  description = "The type of the record (A, CNAME, MX, etc)."
  type        = string
}

variable "ttl" {
  description = "The TTL of the record (in seconds)."
  type        = number
  default     = 300
}

variable "records" {
  description = "The list of values for the record."
  type        = list(string)
  default     = []
}

variable "allow_overwrite" {
  description = "Allow overwriting existing records."
  type        = bool
  default     = true
}

variable "set_identifier" {
  description = "A unique identifier for the record (required for some routing policies)."
  type        = string
  default     = null
}

variable "alias" {
  description = "Alias block for routing to AWS resources."
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  default = null
}

variable "failover_routing_policy" {
  description = "Failover routing policy config (primary or secondary)."
  type = object({
    type = string
  })
  default = null
}

variable "latency_routing_policy" {
  description = "Latency routing policy config."
  type = object({
    region = string
  })
  default = null
}

variable "geolocation_routing_policy" {
  description = "Geolocation routing policy config."
  type = object({
    continent   = optional(string)
    country     = optional(string)
    subdivision = optional(string)
  })
  default = null
}

variable "weighted_routing_policy" {
  description = "Weighted routing policy config."
  type = object({
    weight = number
  })
  default = null
}

