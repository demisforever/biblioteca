# README
## Biblioteca
Library web api in Ruby on rails.

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version

ruby-3.1.2

* Database creation

PostgreSQL version 15.4 Windows x86-64

```
git clone https://github.com/demisforever/biblioteca.git
bundle install
rais s
```
* System dependencies

* Configuration


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Commands that I run to create the project.

###  Endpoint: (I use Postman)
```
POST: Body: Raw: JSON: http://localhost:3000/books
{
    "title": "Redes de computadoras",
    "author": "Andrew S. Tanenbaum"
}
```
```
POST: Body: Raw: JSON: http://localhost:3000/users
{
    "name": "Demis",
    "email": "demisgero22@gmail.com"
}
```

## ---- you don't have to run them!! ----

First I created new rails API with a PostgreSQL database:
```
rails new biblioteca --api --database=postgresql
rails db:create
rails g scaffold Book title:string type:string author:string
rails g scaffold User name:string email:string
rails g scaffold State borrowed_at:datetime returned_at:datetime user:references book:references
rails db:migrate
```


This will reset your database and reload your current schema with all:
```
rake db:reset db:migrate
```
This will destroy your db and then create it and then migrate your current schema:
```
rake db:drop db:create db:migrate
```

To remove a column from a table using a Rails migration, in this case:
```
rails g migration delete_type_column_from_books
rails db:migrate
```

Interactors
```
rails generate interactor book_state_create
```
## ---- you don't have to run them!! ----