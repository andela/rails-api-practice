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

Naming Conventions:
> Active Record uses some naming conventions to find out how the mapping between models and database tables should be created. Rails will pluralize your class names to find the respective database table. So, for a class Book, you should have a database table called books.
