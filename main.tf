# Optional: Create a VPC and subnet (if you don't already have one)
resource "google_compute_network" "vpc_network" {
  name                    = "gke-network11"
  auto_create_subnetworks = true
}

# GKE Cluster
resource "google_container_cluster" "my_cluster" {
  name     = "my-cluster"
  location = "us-central1-a"

  remove_default_node_pool = true
  deletion_protection      = false
  initial_node_count       = 1

  network    = google_compute_network.vpc_network.name

  # Logging & Monitoring (default)
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}

# Node Pool (2 nodes, e2-medium, pd-standard)
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = "us-central1-a"
  cluster    = google_container_cluster.my_cluster.name
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_type    = "pd-standard"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
