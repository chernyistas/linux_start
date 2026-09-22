# ============================================================
# outputs.tf — что показать после apply
# ============================================================

output "contaier_name" {
  description = "Имя созданного контейнера"
  value       = docker_container.nginx.name
}

output "container_url" {
  description = "URL для доступа к nginx"
  value       = "http://localhost:${var.nginx_port}"
}

output "network_id" {
  description = "ID Docker-сети"
  value       = docker_network.app_net.id
}

output "container_id" {
  description = "IP-адрес контейнера внутри сети"
  value       = docker_container.nginx.network_data[0].ip_address
}
