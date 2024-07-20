resource "docker_service" "frontend" {
  name = "${var.frontend_service_name}"

  task_spec {
    container_spec {
      image = "${var.docker_username}/node-frontend:${var.frontend_image_tag}"
      env = {
        BACKEND_AUTH_TOKEN=var.frontend_api_token
        BACKEND_API_URL=var.backend_url
      }
    }

    networks_advanced {
      name = docker_network.node_network.name
    }

    restart_policy {
      condition = "on-failure"
    }
  }

  mode {
    replicated {
      replicas = 1
    }
  }
}
