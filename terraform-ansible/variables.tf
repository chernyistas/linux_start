# ============================================================
# variables.tf — параметры Terraform
# ============================================================
variable "container_name" {
  description = "Имя Docker-контейнера (Имитация ВМ)"
  type        = string
  default     = "terraform-vm"
}

variable "ssh_port" {
  description = "Порт на хосте для SSH (ипроброс на 22 в контейнере)"
  type        = number
  default     = 2222
}

variable "docker_image" {
  description = "Образ для контейнера (Ubuntu с SSH)"
  type        = string
  default     = "rastasheep/ubuntu-sshd:18.04"
}

variable "ansible_inventory_path" {
  description = "Путь к файлу inventory для Ansible"
  type        = string
  default     = "./inventory.ini"
}  
