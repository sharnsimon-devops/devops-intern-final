job "hello" {
  datacenters = ["dc1"]
  type = "service"

  update {
    max_parallel     = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
  }

  group "hello-group" {
    restart {
      attempts = 3
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    task "hello-task" {
      driver = "docker"

      config {
        image = "ghcr.io/your-org/devops-intern-final:latest"

        logging {
          type = "loki"
          config {
            loki-url = "http://localhost:3100/loki/api/v1/push"
            loki-external-labels = "job=hello"
          }
        }
      }

      resources {
        cpu    = 100
        memory = 64
      }
    }
  }
}

