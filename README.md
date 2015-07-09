## Building an exposing an api built in Ruby On Rails

#### Introduction and topics
This tutorial will build an application that exposes data pertaining to vendors and suya.

In this tutorial/walkthrough, we will cover the following topics:
-Setting up a rails api application
-Creating models and their associated tables in a database.
-Validating model columns.
-Creating columns for these tables in the database with different types
-Setting up associations between two tables (has_many and belongs_to associations)
-Unit Testing and Controller Testing. We will test validations and controller endpoints.
-ActiveModel Serializers for manipulating the delivered JSON.
-Rails routes, gemfile
-We will explore how to use the pry gem which is a kind of Ruby debugger.


#### Let's Begin.

1. Install the Rails-api gem on your machine.
```Bash
gem install rails-api
```

2. After that, change into the directory where you want your project to live and type:

```Bash
rails-api new api_rails_tutorial
```

You should see a bunch of files being created. However, you will notice that there are no app/views created or app/assets/js created or app/assets/images. You will just be creating an api and so none of these front-end files are created as a result of the rails-api gem.

3. CD into this new project folder.

4. Let's start by creating some models, migration files, and tables in your database.
Let's start with the models and migration files.
Here are some useful links:
[Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html)
[Hartl Tutorial chapter on models and AR](https://www.railstutorial.org/book/modeling_users)

I recommend reading both before continuing. If you need to read the Hartl Tutorial's earlier chapters to gain an understanding
of Ruby or Rails concepts, please feel free to do so. Ruby/Rails takes time so do not mind if this is a long process.  

If you want to move on, here are some important quotes.  

From the Hartl Tutorial, an explanation of Rails Models, the M in MVC:
> In Rails, the default data structure for a data model is called, naturally enough, a model (the M in MVC from Section 1.3.3). The default Rails solution to the problem of persistence is to use a database for long-term data storage, and the default library for interacting with the database is called Active Record.1 Active Record comes with a host of methods for creating, saving, and finding data objects, all without having to use the structured query language (SQL)2 used by relational databases. Moreover, Rails has a feature called migrations to allow data definitions to be written in pure Ruby, without having to learn an SQL data definition language (DDL). The effect is that Rails insulates you almost entirely from the details of the data store.

From the Hartl Tutorial, an explanation of migrations and how they are created:
> Migrations provide a way to alter the structure of the database incrementally, so that our data model can adapt to changing requirements. In the case of the User model, the migration is created automatically by the model generation script;
> Note that the name of the migration file is prefixed by a timestamp based on when the migration was generated.
> The migration itself consists of a change method that determines the change to be made to the database. In the case of Listing 6.2, change uses a Rails method called create_table to create a table in the database for storing users.

Naming Conventions:
> Active Record uses some naming conventions to find out how the mapping between models and database tables should be created. Rails will pluralize your class names to find the respective database table. So, for a class Book, you should have a database table called books.


Anyway, once you have a basic understanding of models and migrations, let's move on.

In the parent directory of your project, type:
```Bash
rails g model Vendor name:string
```

That command will generate (the "g") a model called Vendor with a name column in the database of type string. Notice some convention here. It is important that you name your model a singular name. Also, the name of the column is first with the data-type of the column second.

This will invoke AR, create a model, a migration, and a test file for the model.
You should see this in your terminal:

> invoke  active_record
      create    db/migrate/20150709123903_create_his.rb
      create    app/models/hi.rb
      invoke    test_unit
      create      test/models/hi_test.rb
      create      test/fixtures/his.yml
