resource "kubernetes_secret" "backend_secret" {
  metadata {
    name = "backend-secret"
  }
  
  data = {
    server_api_key = base64encode(var.backend_api_key)
  }
}