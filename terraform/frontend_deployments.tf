resource "kubernetes_deployment" "frontend_deployment" {
  metadata {
    name = "frontend-deployment"
    labels = {
      app = "frontend"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        container {
          name  = "node-frontend"
          image = "vourteen14/node-frontend:latest"
          ports {
            container_port = 4502
          }

          env {
            name = "BACKEND_AUTH_TOKEN"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.frontend_secret.metadata[0].name
                key  = "BACKEND_AUTH_TOKEN"
              }
            }
          }

          env {
            name = "BACKEND_API_URL"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.frontend_secret.metadata[0].name
                key  = "BACKEND_API_URL"
              }
            }
          }
        }

        volume {
          name = "frontend_secret"
          secret {
            secret_name = kubernetes_secret.frontend_secret.metadata[0].name
          }
        }
      }
    }
  }
}