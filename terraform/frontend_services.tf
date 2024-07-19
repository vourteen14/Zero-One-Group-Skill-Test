resource "kubernetes_service" "frontend_service" {
  metadata {
    name = "frontend-service"
  }

  spec {
    selector = {
      app = "frontend"
    }

    port {
      port        = 4502
      target_port = 4502
    }

    type = "ClusterIP"
  }
}