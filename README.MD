# intro to ruby and rails

this is a autolearning tutorial for to get in touch with ruby and rails.

first of all I generate a docker-compose following (not strictly [docker tutorial for rails](https://docs.docker.com/samples/rails/))

after that we have a fresh installation of a ruby running in a service called `web` and other for a `postgres` database, running `CMD ["tail", "-f", "/dev/null"]` for keep the container up and running ;).

## starting with rails

after that we started to follow this [tutorial](https://guides.rubyonrails.org/v5.2/getting_started.html)


1. installing rails `gem install rails` check the install with `rails --version`

2. creating the app `rails new blog --database=postgresql` This will create a Rails application called `Blog` in a `blog` directory and install the gem dependencies that are already mentioned in `Gemfile` using bundle install.

>You can see all of the command line options that the Rails application builder accepts by running `rails new -h`

3. run this command to get ownership of the folder 

``` 
sudo chown -R $USER:$USER .
```

4. at this point we need to configure our postgres database for the project. go to `config/database.yml` and 

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```

5. create and migrate the db

```
rails db:create
rails db:migrate
```

6. run `bin/rails server -b '0.0.0.0'`

and....

![](img/hello_world.png)

boilá...