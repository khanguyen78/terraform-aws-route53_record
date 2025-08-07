output "fqdn" {
  description = "The FQDN of the record."
  value       = aws_route53_record.this.fqdn
}

