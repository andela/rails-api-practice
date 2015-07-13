


[Active Model Serializer Gem](https://github.com/rails-api/active_model_serializers)

[Blog Post on Active Model Serializer](https://blog.engineyard.com/2015/active-model-serializers)  
Quote from the above link:
> These days, there are so many different choices when it comes to serving data from an API. You can build it in Node with ExpressJS, in Go with Martini, Clojure with Compojure, and many more. But in many cases, you just want to bring something to market as fast as you can. For those times, I still reach for Ruby on Rails.

>With Rails, you can spin up a function API server in a very short period of time. Rails is large. Perhaps you object that there's "too much magic". Have you ever checked out the rails-api gem? It lets you enjoy all the benefits of Rails without including unnecessary view-layer and asset-related code.

On the active-model-serializers:

> Rails-api is maintained by Carlos Antonio Da Silva, Santiago Pastorino, Rails Core team members, and all-around great Rubyist Steve Klabnik. While not busy working on Rails or the Rails API Gem, they found the time to put together the active_model_serializers gem to make it easier to format JSON responses when using Rails as an API server... ActiveModel::Serializers (AMS) is a powerful alternative to jbuilder, rabl, and other Ruby templating solutions.

#### Let's Begin

So currently our API response is mad ugly (I believe this is the technical term).  
http://mediadb.kicker.de/2015/fussball/spieler/xl/39686_14_2014812112123295.jpg

It would be nice if we could remove the timestamps and IDs in our API response.  
This is where AMS comes in.

1. Add the active-model-serializers gem to the Gemfile.

    In our Gemfile, type:

    ```rubyonrails
    gem "active_model_serializers", github: "rails-api/active_model_serializers"
    ```



2. In terminal, type:

    ```Bash
    rails g serializer message.
    ```
