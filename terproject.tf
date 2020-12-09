provider "google" {
  credentials = file("keys.json")
  project     = "southern-shard-292013"
}
resource "google_compute_instance" "my_Ubuntu" {
  name         = "demoproject"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server"]
}
