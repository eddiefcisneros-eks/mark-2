


data "external" "az_username" {
  program = [jsondecode("az","ad","signed-in-user", "show", "--query", "givenName", "-o", "tsv")
  ]

  query = {
    name = "givenName"
  }
}