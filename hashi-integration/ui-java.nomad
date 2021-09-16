job "ui-java" {
  datacenters = ["dc1"]

  type = "service"

  group "group" {
    network {
      port "springboot" {
        static = 8080
      }
    }
    count = 1
    task "web" {
     service {
        tags = ["spring"]
        port = "springboot"
        meta {
          meta = "for your service"
        }
        check {
          type     = "http"
          port     = "springboot"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
      driver = "java"
      artifact {
        source = "https://jar-tkaburagi.s3-ap-northeast-1.amazonaws.com/nomad-hcintegration-0.0.1-SNAPSHOT.jar"
      }
      config {
        jar_path    = "local/nomad-hcintegration-0.0.1-SNAPSHOT.jar"
        jvm_options = ["-Xmx2048m", "-Xms256m"]
      }
      resources {
        cpu    = 500
        memory = 512
        network {
          port "http" {}
        }
      }
    }
  }
}
