# Project Manager on Rails

## Description

This is a Rails application that serves as a project management tool.

The project contains required features for a project management tool styled with Bootstrap 5.

The features include:
- User authentication & CRUD operations for users
- CRUD operations for projects
- CRUD operations for tasks
- CRUD operations for attachments

Each project has many tasks and each task has many attachments.

## Requirements
- Ruby 3.2 or higher
- Rails 7.0 or higher
- PostgreSQL running on localhost

## Database Configuration
This application uses PostgreSQL as its database.
The database configuration is located in `config/database.yml`.
The default configuration is as follows:

This is just for the development environment. In prod, the db config would be set as an ENV file.
Feel free to change the database config to whatever you want.

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  username: postgres
  password: postgres
  pool: 5

development:
  <<: *default
  database: project_manager_dev
 ```

## Setup
1. Clone the Repository
2. Run `bundle install`
3. Make sure PostgreSQL is running on localhost and run `rails db:create`
4. Run `rails db:migrate` to create the database tables
5. Run `rails db:seed` to seed the database with sample data
6. Run `rails s` to start the server
