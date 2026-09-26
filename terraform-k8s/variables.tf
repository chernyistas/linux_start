# ============================================================
# variables.tf — параметры проекта
# ============================================================

variable "namespace_name" {
  description = "Имя namespace для демо-ресурсов"
  type        = string
  default     = "terraform-demo"
}

variable "replicas" {
  description = "Количество Pod'ов Flask"
  type        = number
  default     = 4
}

variable "flask_image" {
  description = "Образ Flask из Docker Hub"
  type        = string
  default     = "itsmeprivet/my-flask-app:latest"
}
