resource "google_compute_network" "vnet" {
  auto_create_subnetworks = false
  name                    = "example"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "example"
  ip_cidr_range = ["10.0.0.0/16"]
  region        = "us-east1"
  network       = google_compute_network.vnet.id
}
resource "google_compute_global_address" "ipaddress" {
  provider = google-beta

  name          = "private-ip-db-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.subnets.id
}

resource "google_service_networking_connection" "this" {
  provider = google

  network                 = google_compute_network.this.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.this.name]
}