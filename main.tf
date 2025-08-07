resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.ttl
  records = var.records

  allow_overwrite = var.allow_overwrite
  set_identifier  = var.set_identifier

  dynamic "alias" {
    for_each = var.alias != null ? [var.alias] : []
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }

  dynamic "failover_routing_policy" {
    for_each = var.failover_routing_policy != null ? [var.failover_routing_policy] : []
    content {
      type = failover_routing_policy.value.type
    }
  }

  dynamic "latency_routing_policy" {
    for_each = var.latency_routing_policy != null ? [var.latency_routing_policy] : []
    content {
      region = latency_routing_policy.value.region
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.geolocation_routing_policy != null ? [var.geolocation_routing_policy] : []
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent", null)
      country     = lookup(geolocation_routing_policy.value, "country", null)
      subdivision = lookup(geolocation_routing_policy.value, "subdivision", null)
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = var.weighted_routing_policy != null ? [var.weighted_routing_policy] : []
    content {
      weight = weighted_routing_policy.value.weight
    }
  }
}

