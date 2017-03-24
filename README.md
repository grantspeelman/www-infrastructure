[![Stories in Ready](https://badge.waffle.io/my-grocery-price-book/www-infrastructure.png?label=ready&title=Ready)](https://waffle.io/my-grocery-price-book/www-infrastructure)
# My Grocery Price Book infrastructure

## Provisioning

to install software and configure the server you require at least `ansible 2.2.0` installed
`python` has to be installed on the host ubuntu machines 

```
  cd ansible
  ansible-galaxy install -r requirements.yml
  ansible-playbook -i production production.yml # for production
```

## Deploying

```
  cd capistrano
  bundle install
  bundle exec cap production deploy
  bundle exec cap vagrant deploy # testing deployment on your vagrant box (visit http://www.groc-test/)
```

## Setting up a development enviroment with vagrant and ansible

* install ansible (For MAC: `brew up && brew install ansible` or checkout [pip install](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-pip))
* install [virtualbox](https://www.virtualbox.org/wiki/Downloads)
* install [vagrant](https://www.vagrantup.com/downloads.html)
* install vagrant vagrant-hostsupdater plugin `vagrant plugin install vagrant-hostsupdater`
* install vagrant vagrant-hosts plugin `vagrant plugin install vagrant-hosts`

###### Vagrant setup steps (after software installation)

Make sure to clone my-grocery-price-book/www and my-grocery-price-book/www-infrastructure on the same directory level

```shell
  git clone git@github.com:my-grocery-price-book/www.git
  git clone git@github.com:my-grocery-price-book/www-infrastructure.git
  cd www-infrastructure
  cd ansible
  ansible-galaxy install -r requirements.yml
  cd ..
  vagrant up # takes about 30 minutes
  vagrant ssh
  cd /vagrant
  bin/rails s -b 0.0.0.0 # then visit http://app.groc.vm:3000/ in your browser
```

Mailcatcher will running on [app.groc.vm:1080](http://app.groc.vm:1080/)