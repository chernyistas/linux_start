# ============================================================
# main.tf — основной файл Terraform
# Здесь описываем провайдера и ресурсы
# ============================================================
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  # host: где находится Docker daemon
  # По умолчанию — unix:///var/run/docker.sock (локальный Docker)
  # Можно не указывать, если Docker на той же машине
}
resource "docker_network" "app_net" {
  name = var.network_name
}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = true
}

resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.nginx_port
  }

  networks_advanced {
    name = docker_network.app_net.name
  }

  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost"]
    interval = "10s"
    timeout  = "3s"
    retries  = 3
  }
}
