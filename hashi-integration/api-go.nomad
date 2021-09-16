job "api-golang" {
  datacenters = ["dc1"]

  type = "service"

  group "api-go" {
    count = 1
    task "api-go" {
      driver = "raw_exec"
      config {
        command = "/Users/kabu/hashicorp/nomad/nomad-allinone/hashi-integration/start-go.sh"
      }
      vault {
        policies    = ["mysqlnomad"]
        change_mode = "restart"
      }
      template {
        data        = <<EOH
          {{with secret "mysql-nomad/creds/role-handson"}}{{.Data | toJSON }}{{end}}
          EOH
        destination = "${NOMAD_SECRETS_DIR}/mysql-secret-json"
      }
    }
  }
}
