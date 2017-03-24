# Create the Digital Ocean provider
provider "digitalocean" {
  token = "${var.do_api_token}"
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
    value = "139.59.184.144"
    proxied = true
}

resource "cloudflare_record" "db" {
  domain = "my-grocery-price-book.co.za"
  type = "A"
  name = "db"
  value = "178.62.104.169"
  proxied = false
}
