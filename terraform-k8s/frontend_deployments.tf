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
          
          port {
            container_port = 4501
          }

          env {
            name = "BACKEND_API_URL"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.frontend_secret.metadata[0].name
                key  = "backend_api_url"
              }
            }
          }

          env {
            name = "BACKEND_AUTH_TOKEN"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.frontend_secret.metadata[0].name
                key  = "server_auth_token"
              }
            }
          }
        }

        volume {
          name = "frontend-secret"
          secret {
            secret_name = kubernetes_secret.frontend_secret.metadata[0].name
          }
        }
      }
    }
  }
}
