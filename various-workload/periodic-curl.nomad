job "periodic-curl" {
  datacenters = ["dc1"]
  type        = "batch"

  periodic {
    cron             = "*/5 * * * * * ?"
    prohibit_overlap = true
    time_zone        = "Asia/Tokyo"
  }

  group "periodic-curl" {
    count = 1
    task "periodic-curl" {
      driver = "raw_exec"
      config {
        command = "/Users/kabu/hashicorp/nomad/nomad-allinone/various-workload/periodic.sh"
      }
    }
  }
}
