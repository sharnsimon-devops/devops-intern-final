job "hello" {
  datacenters = ["dc1"]
  type = "service"

  group "hello-group" {
    task "hello-task" {
      driver = "docker"

      config {
        image = "devops-intern-final:latest"
      }

      resources {
        cpu    = 100
        memory = 64
      }
    }
  }
}
