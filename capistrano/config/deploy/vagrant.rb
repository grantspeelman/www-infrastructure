ask :branch, 'master'

server 'app.groc.vm', user: 'my_grocery_price_book_www', roles: %w{app db}
server 'app2.groc.vm', user: 'my_grocery_price_book_www', roles: %w{app}
server 'www.groc.vm', user: 'my_grocery_price_book_www', roles: %w{web}