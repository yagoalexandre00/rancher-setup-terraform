terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}


resource "digitalocean_droplet" "vm_rancher_ubuntu" {
  image    = var.droplet_image
  name     = var.droplet_name
  region   = var.region
  size     = var.droplet_setup
  ssh_keys = [data.digitalocean_ssh_key.ssh_fedora.id]
}

data "digitalocean_ssh_key" "ssh_fedora" {
  name = var.ssh_key_name
}

variable "token" {}
variable "region" {}
variable "droplet_name" {}
variable "droplet_setup" {}
variable "droplet_image" {}
variable "ssh_key_name" {}

output "droplet_ip" {
  value = digitalocean_droplet.vm_rancher_ubuntu.ipv4_address
}