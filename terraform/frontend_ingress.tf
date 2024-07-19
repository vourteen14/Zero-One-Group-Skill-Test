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
          path = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.frontend_service.metadata[0].name
              port {
                number = 4502
              }
            }
          }
        }
      }
    }
  }
}
