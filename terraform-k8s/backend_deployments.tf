resource "kubernetes_deployment" "backend_deployment" {
  metadata {
    name = "backend-deployment"
    labels = {
      app = "backend"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        container {
          name  = "node-backend"
          image = "vourteen14/node-backend:latest"
          
          port {
            container_port = 4501
          }

          env {
            name = "SERVER_API_KEY"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.backend_secret.metadata[0].name
                key  = "server_api_key"
              }
            }
          }
        }

        volume {
          name = "backend-secret"
          secret {
            secret_name = kubernetes_secret.backend_secret.metadata[0].name
          }
        }
      }
    }
  }
}
