#Manages a static time resource, which keeps a locally sourced UTC timestamp stored in the Terraform state.
resource "time_static" "JCRS-e-time" {}