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

resource "digitalocean_droplet" "app-runner1" {
  image = "ubuntu-16-04-x64"
  name = "my-grocery-book-app-runner1"
  region = "lon1"
  size = "512mb"
  ssh_keys = ["${var.ssh_fingerprint}"]
}

resource "digitalocean_droplet" "app-runner2" {
  image = "ubuntu-16-04-x64"
  name = "my-grocery-book-app-runner2"
  region = "lon1"
  size = "512mb"
  ssh_keys = ["${var.ssh_fingerprint}"]
}

resource "digitalocean_droplet" "web-balancer" {
  image = "ubuntu-16-04-x64"
  name = "my-grocery-book-web-balancer"
  region = "lon1"
  size = "512mb"
  ssh_keys = ["${var.ssh_fingerprint}"]
}

# Configure the CloudFlare provider
provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

resource "cloudflare_record" "www" {
    domain = "my-grocery-price-book.co.za"
    type = "A"
    name = "www"
    value = "${digitalocean_droplet.web-balancer.ipv4_address}"
    proxied = true
}

resource "cloudflare_record" "app1" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "app1"
  value = "${digitalocean_droplet.app1.ipv4_address}"
  proxied = false
}

resource "cloudflare_record" "app-runner1" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "app-runner1"
  value = "${digitalocean_droplet.app-runner1.ipv4_address}"
  proxied = false
}

resource "cloudflare_record" "app-runner2" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "app-runner2"
  value = "${digitalocean_droplet.app-runner2.ipv4_address}"
  proxied = false
}

resource "cloudflare_record" "db" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "db"
  value = "178.62.104.169"
  proxied = false
}