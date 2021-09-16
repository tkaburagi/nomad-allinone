job "front-api-golang" {
  datacenters = ["dc1"]

  type = "service"

  group "front-api-go" {
    count = 1
    task "front-api.go" {
      driver = "raw_exec"
      config {
        command = "/Users/kabu/hashicorp/nomad/nomad-allinone/various-workload/front-go/start-go.sh"
      }
    }
    // task "go-mod-init" {
    //   lifecycle {
    //     hook = "prestart"
    //     sidecar = false
    //   }    
    //   driver = "raw_exec"
    //   config {
    //     command = "/Users/kabu/hashicorp/nomad/nomad-allinone/various-workload/front-go/mod.sh"
    //   }
    // }
  }
}
