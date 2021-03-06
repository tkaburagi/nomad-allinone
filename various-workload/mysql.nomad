job "mysql_v5-7-28" {
  datacenters = ["dc1"]
  type = "service"

  group "mysql-group" {
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
    task "mysql-task" {
      driver = "docker"
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