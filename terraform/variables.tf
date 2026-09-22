# ============================================================
# variables.tf — параметры, которые можно менять
# ============================================================

variable "nginx_port" {
  description = "Порт на хосте, куда пробросить nginx"
  type        = number
  default     = 8081
}

variable "nginx_image" {
  description = "Образ nginx"
  type        = string
  default     = "nginx:latest"
}

variable "network_name" {
  description = "Имя Docker-сети"
  type        = string
  default     = "terraform-network"
} 
