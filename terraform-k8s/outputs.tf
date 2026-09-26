# ============================================================
# outputs.tf — что показать после terraform apply
# ============================================================

output "namespace" {
  description = "Имя созданного namespace"
  value       = kubernetes_namespace.demo.metadata[0].name
}

output "deployment_name" {
  description = "Имя Deployment"
  value       = kubernetes_deployment.flask_demo.metadata[0].name
}

output "service_name" {
  description = "Имя Service"
  value       = kubernetes_service.flask_demo.metadata[0].name
}

output "replicas" {
  description = "Количество Pod'ов"
  value      = var.replicas
}

output "how_to_access" {
  description = "Как проверить приложение"
  value       = "kubectl port-forward -n ${var.namespace_name} svc/flask-demo-service 8080:80"
}
