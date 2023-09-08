# README
## Biblioteca
Library web api in Ruby on rails

This README would normally document whatever steps are necessary to get the
application up and running.

git clone https://github.com/demisforever/biblioteca.git

Things you may want to cover:

* Ruby version

ruby-3.1.2

* System dependencies

* Configuration

bundle install

* Database creation

PostgreSQL version 15.4 Windows x86-64

gem "pg", "~> 1.1"

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Commands that I run to create the project, you don't have to run them!!

First I created new rails API with a PostgreSQL database:

rails new biblioteca --api --database=postgresql

rails db:create

rails g model Book title:string type:string author:string

rails g model User name:string email:string

rails g model State borrowed_at:datetime returned_at:datetime user:references book:references

rails db:migrate

* you don't have to run them!!