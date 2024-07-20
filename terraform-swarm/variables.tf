variable "docker_username" {
  type        = string
  default     = ""
}

variable "backend_service_name" {
  type        = string
  default     = "node-backend"
}

variable "backend_domain" {
  type        = string
  default     = ""
}

variable "backend_url" {
  type        = string
  default     = ""
}

variable "backend_api_key" {
  type        = string
  default     = ""
}

variable "backend_image_tag" {
  type        = string
  default     = "latest"
}

variable "frontend_domain" {
  type        = string
  default     = ""
}

variable "frontend_service_name" {
  type        = string
  default     = "node-frontend"
}

variable "frontend_image_tag" {
  type        = string
  default     = "latest"
}

variable "frontend_api_token" {
  type        = string
  default     = ""
}