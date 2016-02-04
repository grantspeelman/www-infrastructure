ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

server '192.168.30.15', user: 'my_grocery_price_book_www', roles: %w{app db web}