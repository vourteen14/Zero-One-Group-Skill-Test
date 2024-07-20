resource "kubernetes_secret" "frontend_secret" {
  metadata {
    name = "frontend-secret"
  }
  
  data = {
    backend_auth_token  = base64encode(var.backend_api_key)
    backend_api_url     = base64encode(var.backend_domain)
  }
}