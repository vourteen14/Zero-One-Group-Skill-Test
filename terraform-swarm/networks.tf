resource "docker_network" "node_network" {
  name   = "node-network"
  driver = "overlay"
}