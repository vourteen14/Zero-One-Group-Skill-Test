resource "docker_service" "nginx_ingress" {
  name = "nginx-ingress"

  task_spec {
    
    container_spec {
      image = "nginx:latest"
      
      mounts {
        target = "/etc/nginx/conf.d"
        source = "${path.module}/nginx_config"
        type   = "bind"
        read_only = true
      }
    }

    networks_advanced {
      name = docker_network.node_network.name
    }
  }

  mode {
    replicated {
      replicas = 1
    }
  }

  endpoint_spec {
    ports {
      target_port    = 80
      published_port = 80
    }
    ports {
      target_port    = 443
      published_port = 443
    }
  }
}
