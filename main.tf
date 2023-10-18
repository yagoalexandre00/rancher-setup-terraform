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


resource "digitalocean_droplet" "vm_rancher" {
  image    = var.droplet_image
  name     = var.droplet_name_rancher
  region   = var.region
  size     = var.droplet_setup
  ssh_keys = [data.digitalocean_ssh_key.ssh_fedora.id]
}

resource "digitalocean_droplet" "vm_k8s_1" {
  image    = var.droplet_image
  name     = var.droplet_name_k8s_1
  region   = var.region
  size     = var.droplet_setup
  ssh_keys = [data.digitalocean_ssh_key.ssh_fedora.id]
}

resource "digitalocean_droplet" "vm_k8s_2" {
  image    = var.droplet_image
  name     = var.droplet_name_k8s_2
  region   = var.region
  size     = var.droplet_setup
  ssh_keys = [data.digitalocean_ssh_key.ssh_fedora.id]
}

resource "digitalocean_droplet" "vm_k8s_3" {
  image    = var.droplet_image
  name     = var.droplet_name_k8s_3
  region   = var.region
  size     = var.droplet_setup
  ssh_keys = [data.digitalocean_ssh_key.ssh_fedora.id]
}



data "digitalocean_ssh_key" "ssh_fedora" {
  name = var.ssh_key_name
}

variable "token" {}
variable "region" {}
variable "droplet_name_rancher" {}
variable "droplet_name_k8s_1" {}
variable "droplet_name_k8s_2" {}
variable "droplet_name_k8s_3" {}
variable "droplet_setup" {}
variable "droplet_image" {}
variable "ssh_key_name" {}

output "droplet_ip" {
  value = digitalocean_droplet.vm_rancher.ipv4_address
}