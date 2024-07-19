resource "kubernetes_service" "backend_service" {
  metadata {
    name = "backend-service"
  }

  spec {
    selector = {
      app = "backend"
    }

    port {
      port        = 4501
      target_port = 4501
    }

    type = "ClusterIP"
  }
}