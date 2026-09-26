# ============================================================
# main.tf — Terraform-конфигурация для Kubernetes
# ============================================================

# ------------------------------------------------------------
# 1. Блок terraform: какие провайдеры нужны
# ------------------------------------------------------------
terraform {
  required_providers {
    kubernetes = { 
      source = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

# ------------------------------------------------------------
# 2. Провайдер kubernetes: как подключаться к кластеру
# ------------------------------------------------------------
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# ------------------------------------------------------------
# 3. Namespace — изолированное пространство для ресурсов
# ------------------------------------------------------------
resource "kubernetes_namespace" "demo" {
  metadata {
    name = var.namespace_name

    labels = {
      managed_by = "terraform"
      purpose    = "learning"
    }
  }
}

# ------------------------------------------------------------
# 4. Deployment — управляет Pod'ами приложения
# ------------------------------------------------------------

resource "kubernetes_deployment" "flask_demo" {
  metadata {
    name = "flask-demo"

    namespace = kubernetes_namespace.demo.metadata[0].name

    labels = {
      app = "flask-demo"
    }
  }

  spec {

    replicas = var.replicas

    selector {
      match_labels = {
        app = "flask-demo"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask-demo"
        }
      }

      spec {
        container {
          name = "flask"

          image = var.flask_image

          port {
            container_port = 5000
          }

          resources {
            requests = {
              cpu = "100m" 
              memory = "128Mi"
            }

          limits = {
            cpu = "200m"
            memory = "256Mi"
          }
        }

        readiness_probe {
          http_get {
            path = "/"
            port = 5000
          }

          initial_delay_seconds = 5

          period_seconds = 10
        }
      }
    }
  }  
}
}

# ------------------------------------------------------------
# 5. Service — постоянный адрес для Pod'ов
# ------------------------------------------------------------

resource "kubernetes_service" "flask_demo" {
  metadata {
    name = "flask-demo-service"
    namespace = kubernetes_namespace.demo.metadata[0].name
  }

  spec {
    selector = {
      app = "flask-demo"
    }
    port {
      port = 80
    target_port = 5000
    protocol = "TCP"
    }
    type = "ClusterIP"
  }
}

   
