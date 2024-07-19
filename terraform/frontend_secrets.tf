resource "kubernetes_secret" "frontend_secret" {
  metadata {
    name = "frontend-secret"
  }
  
  data = {
    BACKEND_AUTH_TOKEN  = base64encode(var.backend_api_key)
    BACKEND_API_URL     = base64encode(var.backend_domain)
  }
}