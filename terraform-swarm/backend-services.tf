resource "docker_service" "backend" {
  name = "${var.backend_service_name}"

  task_spec {
    container_spec {
      image = "${var.docker_username}/node-backend:${var.backend_image_tag}"
      env = {
        HOST="0.0.0.0",
        PORT=4501,
        SERVER_API_KEY=var.backend_api_key
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
