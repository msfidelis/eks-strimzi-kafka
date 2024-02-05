output "bootstrap_servers_plaintext" {
  value = format("%s:9092", aws_lb.kafka.dns_name)
}

output "grafana_url" {
  value = format("%s:80", aws_lb.prometheus.dns_name)
}

output "grafana_default_user" {
  value = "admin"
}

output "grafana_default_pass" {
  value = "prom-operator"
}