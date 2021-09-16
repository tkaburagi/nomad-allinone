job "mysql" {
  datacenters = ["dc1"]
  type = "service"

  group "group" {
    count = 1
    volume "mysql-vol" {
      type = "host"
      read_only = false
      source = "mysql-vol"
    }
    network {
      port "db" {
        static = 3306
      }
    }
    task "v5" {
      driver = "docker"
      service {
          tags = ["mysql"]
          port = "db"
          meta {
            meta = "for your service"
          }
          check {
            type     = "tcp"
            port     = "db"
            path     = "/"
            interval = "10s"
            timeout  = "2s"
          }
        }
      volume_mount {
        volume = "mysql-vol"
        destination = "/var/lib/mysql"
        read_only = false
      }
      config {
        image = "mysql:5.7.28"
        ports = ["db"]
      }
      env {
        MYSQL_ROOT_PASSWORD = "rooooot"
      }
      resources {
        cpu = 500
        memory = 1024
      }
    }
  }
}