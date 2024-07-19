resource "kubernetes_secret" "backend_secret" {
  metadata {
    name = "backend_secret"
  }
  
  data = {
    SERVER_API_KEY = base64encode(var.backend_api_key)
  }
}