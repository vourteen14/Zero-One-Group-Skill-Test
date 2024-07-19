variable "k8s_host" {
  type        = string
  default     = ""
}

variable "k8s_token" {
  type        = string
  default     = ""
}

variable "k8s_ca_certificate" {
  type        = string
  default     = ""
}

variable "backend_domain" {
  type        = string
  default     = ""
}

variable "frontend_domain" {
  type        = string
  default     = ""
}

variable "backend_api_key" {
  type        = string
  default     = ""
}

locals {
  kubernetes_host    = var.k8s_host != "" ? var.k8s_host : (lookup(var.env, "KUBERNETES_HOST", ""))
  k8s_token          = var.k8s_token != "" ? var.k8s_token : (lookup(var.env, "KUBERNETES_TOKEN", ""))
  k8s_ca_certificate = var.k8s_ca_certificate != "" ? var.k8s_ca_certificate : (lookup(var.env, "KUBERNETES_CA_CERTIFICATE", ""))
  backend_api_key    = var.backend_api_key != "" ? var.backend_api_key : (lookup(var.env, "BACKEND_API_KEY", ""))
  backend_domain     = var.backend_domain != "" ? var.backend_domain : (lookup(var.env, "BACKEND_DOMAIN", ""))
  frontend_domain    = var.frontend_domain != "" ? var.frontend_domain : (lookup(var.env, "FRONTEND_DOMAIN", ""))
}