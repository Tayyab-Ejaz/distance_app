##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.5]()
- Rails [6.0.5]()

##### 1. Check out the repository

```bash
git clone https://github.com/Tayyab-Ejaz/distance_app.git
```

##### 2. Create config files database.yml & application.yml file

Copy the sample database.yml & application.yml file and edit the configuration as required.

```bash
cp config/application.yml.sample config/application.yml
```
```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
