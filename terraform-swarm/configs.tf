data "template_file" "nginx_config" {
  template = file("${path.module}/config/nginx_template.conf.tpl")

  vars = {
    backend_domain         = var.backend_domain
    backend_service_name   = var.backend_service_name
    frontend_domain        = var.frontend_domain
    frontend_service_name  = var.frontend_service_name
  }
}

resource "local_file" "nginx_config" {
  content  = data.template_file.nginx_config.rendered
  filename = "${path.module}/config/nginx_reverse.conf"
}
