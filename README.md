# My Grocery Price Book infrastructure

[![Build Status](https://semaphoreci.com/api/v1/my-grocery-price-book/www-infrastructure/branches/master/badge.svg)](https://semaphoreci.com/my-grocery-price-book/www-infrastructure)

## Provisioning

to install software and configure the server you require at least `ansible 2.0.0` installed

```
  cd ansible
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
* install vagrant-dns `vagrant plugin install vagrant-dns`

###### Vagrant setup steps (after software installation)

Make sure to clone my-grocery-price-book/www and my-grocery-price-book/www-infrastructure on the same directory level

```shell
  git clone git@github.com:my-grocery-price-book/www.git
  git clone git@github.com:my-grocery-price-book/www-infrastructure.git
  cd www-infrastructure
  vagrant dns --install
  vagrant up # takes about 30 minutes then visit http://www.groc-dev/ in your browser
  vagrant ssh
```

Once the setup is complete you should be able to visit [www.groc-dev](http://www.groc-dev/) on your local machine.
Mailcatcher will running on [www.groc-dev:1080](http://www.groc-dev:1080/)