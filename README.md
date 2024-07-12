# Swivel Coding Challenge
This README would normally document whatever steps are necessary to get the
application up and running.

## Tabel of Content

1. Ruby Version
2. Installation
3. Starting the server
4. Test Cases

## Ruby Version

To run this application you need to have ruby version of 3.1.2.

## Installation

To install all the system dependency and gems is required to start the application. Run the below command
```http 
bundle install
```
To create database in the application.
```http 
rails db:create
```
To create required tables in the database in application.
```http 
rails db:migrate
```

To sample data in the tables by using faker gem.
```http 
rails db:seed
```

## Start the server

To the server of the application run below command.
```sh
rails server
```

## Login

You need to below creditenals for login or you can create a new one.
```sh
email: test_user@gmail.com
password: 12345678
```

## Run Test Case
To run the test case. Run the below the command in the terminal.

For controller:
```ssh
bundle exec rspec ./spec/controllers/tasks_controller_spec.rb
```