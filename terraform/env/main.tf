# VPC
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc.self_link
}

# PostgreSQL Database
resource "google_sql_database_instance" "database_instance" {
  name             = var.db_instance_name
  database_version = "POSTGRES_13"
  region           = var.region
  project          = var.project_id

  settings {
    tier = "db-f1-micro"
  }
}

# Compute Instances
resource "google_compute_instance" "compute_instances" {
  count        = var.instance_count
  name         = "${var.instance_name}-${count.index}"
  machine_type = var.instance_machine_type
  zone         = var.instance_zone
  tags         = [var.instance_tags]

  network_interface {
    network       = google_compute_network.vpc.self_link
    subnetwork    = google_compute_subnetwork.subnet.self_link
    access_config {
      # Leave empty to have only a private IP
    }
  }

  metadata_startup_script = var.startup_script
}

resource "google_compute_firewall" "allow_postgres" {
  name        = "allow-postgres"
  network     = google_compute_network.vpc.self_link
  description = "Allow inbound traffic on port 5432 for PostgreSQL"

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}

resource "google_compute_firewall" "allow_http" {
  name        = "allow-http"
  network     = google_compute_network.vpc.self_link
  description = "Allow inbound traffic on port 80 for HTTP"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}

resource "google_compute_firewall" "allow_https" {
  name        = "allow-https"
  network     = google_compute_network.vpc.self_link
  description = "Allow inbound traffic on port 443 for HTTPS"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}


