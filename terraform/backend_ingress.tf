resource "kubernetes_ingress" "backend_ingress" {
  metadata {
    name = "backend-ingress"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = var.backend_domain
      http {
        path {
          path = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.backend_service.metadata[0].name
              port {
                number = 4501
              }
            }
          }
        }
      }
    }
  }
}
