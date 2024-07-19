resource "kubernetes_ingress" "frontend_ingress" {
  metadata {
    name = "frontend-ingress"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = var.frontend_domain
      http {
        path {
          backend {
            service_name = kubernetes_service.frontend_service.metadata[0].name
            service_port = 4502
          }
        }
      }
    }
  }
}