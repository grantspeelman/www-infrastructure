server 'app-runner1.my-grocery-price-book.co.za', user: 'my_grocery_price_book_www', roles: %w{app db web}
server 'app-runner2.my-grocery-price-book.co.za', user: 'my_grocery_price_book_www', roles: %w{app web}


namespace :deploy do
  after :finished, :newrelic_deploy do
    on roles(:db) do
      within release_path do
        execute :bundle, 'exec newrelic deployments', "--user=#{fetch :rollbar_user}", "--revision=#{fetch :current_revision}"
      end
    end
  end
  after :finished, :rollbar_deploy do
    on roles(:db) do
      within release_path do
        execute :rake, 'rollbar:deploy', "LOCAL_USER=#{fetch :rollbar_user}", "ROLLBAR_ENV=#{fetch :stage}", "REVISION=#{fetch :current_revision}"
      end
    end
  end
end