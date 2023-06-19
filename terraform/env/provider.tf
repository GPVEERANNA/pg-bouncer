provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
  version     = "3.5.0"  # Use the desired version of the Google Cloud provider
}
