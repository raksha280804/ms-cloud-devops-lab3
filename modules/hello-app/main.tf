terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.4"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

variable "image_tag" {
  type    = string
  default = "v2"
}

variable "replicas" {
  type    = number
  default = 3
}

variable "port" {
  type    = number
  default = 8080
}

variable "namespace" {
  type = string
}

resource "kubernetes_namespace_v1" "env" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment_v1" "hello" {
  metadata {
    name = "hello-app"
    namespace = kubernetes_namespace_v1.env.metadata[0].name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "hello-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-app"
        }
      }

      spec {
        container {
          name  = "hello-app"
          image = "shripada/hello-app:${var.image_tag}"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "hello" {
  metadata {
    name = "hello-app"
    namespace = kubernetes_namespace_v1.env.metadata[0].name
  }

  spec {
    type = "LoadBalancer"

    selector = {
      app = "hello-app"
    }

    port {
      port        = var.port
      target_port = 80
    }
  }
}

output "url" {
  value = "http://localhost:${var.port}"
}