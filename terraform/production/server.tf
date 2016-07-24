# Create the Digital Ocean provider
provider "digitalocean" {
  token = "${var.do_api_token}"
}

resource "digitalocean_droplet" "app1" {
  image = "ubuntu-16-04-x64"
  name = "my-grocery-book-app1"
  region = "lon1"
  size = "512mb"
  ssh_keys = ["${var.ssh_fingerprint}"]
}

resource "digitalocean_record" "www" {
    domain = "my-grocery-price-book.co.za"
    type = "A"
    name = "www"
    value = "${digitalocean_droplet.app1.ipv4_address}"
}

resource "digitalocean_record" "app1" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "app1"
  value = "${digitalocean_droplet.app1.ipv4_address}"
}

resource "digitalocean_record" "db" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "db"
  value = "178.62.104.169"
}