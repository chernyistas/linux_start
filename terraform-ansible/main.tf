# ============================================================
# main.tf — Terraform создаёт контейнер + генерирует inventory
# ============================================================

# ------------------------------------------------------------
# Блок terraform: какие провайдеры нужны
# ------------------------------------------------------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# ------------------------------------------------------------
# Провайдер docker: подключение к локальному Docker daemon
# ------------------------------------------------------------
provider "docker" {}

# ------------------------------------------------------------
# 1. Docker-образ: скачиваем Ubuntu с SSH
# ------------------------------------------------------------
resource "docker_image" "vm_image" {
  name         = var.docker_image
  keep_locally = true
}

# ------------------------------------------------------------
# 2. Docker-контейнер: создаём "ВМ"
# ------------------------------------------------------------
resource "docker_container" "vm" {
  name  = var.container_name
  image = docker_image.vm_image.image_id

  ports {
    internal = 22
    external = var.ssh_port
  }
}

# ------------------------------------------------------------
# 3. Ждём, пока SSH в контейнере поднимется
# ------------------------------------------------------------
resource "null_resource" "wait_for_ssh" {
  depends_on = [docker_container.vm]
  provisioner "local-exec" {
    command = <<-EOT
      echo "Ждём SSH в контейнер..."
      for i in $(seq 1 30); do
        if nc -z localhost ${var.ssh_port} 2>/dev/null; then
          echo "SSH готов!"
          exit 0
        fi
        sleep 2
      done
      echo "SSH не поднялся за 60 секунд"
      exit 1
    EOT
  }
}

# ------------------------------------------------------------
# 4. Генерируем inventory для Ansible
# ------------------------------------------------------------
resource "local_file" "ansible_inventory" {
  filename = var.ansible_inventory_path

  content = templatefile("${path.module}/inventory.tpl", {
    container_name = docker_container.vm.name
    ssh_host       = "localhost"
    ssh_port       = var.ssh_port
    ssh_user       = "root"
  })

  depends_on = [null_resource.wait_for_ssh]
}     
