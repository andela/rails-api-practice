## Let's create an api of suya and vendors.

We're going to create api endpoints in this rails app that delivers JSON data.

New JavaScript frameworks emerge constantly, completely changing the way we think about building web applications. With libraries such as AngularJS, Ember.js or Backbone.js, the Rails server is no longer responsible for generating complete pages. Rails is often reduced to serving as a backend for client-side application.

#### Instructions

If you're starting from here, clone this repo down.

#### Let's begin.

1. Let's make a seed file. Open up your seeds.rb file and put this in there:  
    ```rubyonrails
    vendor  = Vendor.create(name: "Jeffe")  
    vendor1 = Vendor.create(name: "Jeffe1")  
    vendor2 = Vendor.create(name: "Jeffe2")  

    5.times do |n|  
      Vendor.create(name: "Jeffe#{n+3}")  
    end

    vendor.suyas << Suya.create(meat: "beef", spicy: true)  
    vendor.suyas << Suya.create(meat: "ram", spicy: true)  
    vendor1.suyas << Suya.create(meat: "chicken", spicy: true)  
    vendor1.suyas << Suya.create(meat: "kidney", spicy: false)  
    vendor2.suyas << Suya.create(meat: "liver", spicy: false)  
    ```

    Keep in mind that you need to use the shovel operator when trying to populate the has_many relationship otherwise you'll see this error:

    ```Bash
     undefined method `each' for #<Suya:0x007f81aea29310>
    ```

  In terminal, type:

  ```Bash
  rake db:seed
  ```  

  to seed your database.

2. In terminal, type:

    ```Bash
    rails console
    ```

    Hit enter. Then play around with these commands:

    ```Bash
    Vendor.all
    ```

    ```Bash
    Vendor.first
    ```

    ```Bash
    Vendor.first.name
    ```

    ```Bash
    Vendor.first.suyas
    ```

    ```Bash
    Vendor.first.suyas[0]
    ```

    ```Bash
    suya = Vendor.first.suyas[0]
    suya.meat
    ```

3. Before we build our api, let's first talk about versioning.

    To be of any value, the API interface (the methods used to receive the JSON data) and the url must remain stable and consistent. If you introduce any changes to the routing, the interface, or parameters passed to the API or response format, all of your clients using the API might break. So that's why we'll be versioning our api with routes like api/v1/vendors instead of just /vendors. In the latter case, only 1 version of the api will exist and so any changes to the api will immediately effect client side applications that consume the api JSON data. Thanks to versioning, you can release new, improved APIs, without cutting off clients using the old one. Let's start with the config/routes.rb file:

    ```rubyonrails
      Rails.application.routes.draw do  
        namespace :api do  
          namespace :v1 do  
            resources :vendors  
          end  
        end  
      end
    ```

    This namespacing will ensure that our urls will look like /api/v1/vendors. A request to that URL will hook into controllers with thes same namespacing.

4.  Next, we need to create api/v1 directory under app/controllers and put our vendors controllers there:

    ```Bash
    rails g controller api/v1/vendors index
    ```

    This will generate a controller with an index action.

    At some point in the future if you want to create a new api, just change your routes file to this:

    ```rubyonrails
    MyApp::Application.routes.draw do
      namespace :api do
        namespace :v1 do
          resources :user
          ...
        end

        namespace :v2 do
          resources :user
          ...
        end
      end
    end
    ```

    and create teh new controller nested under a v2 folder.

5. Now let's render a response in JSON. There are many ways to communicated with the API. The most popular choices are XML and
    JSON. For our sample application we will just use JSON, or JavaScript Object Notation, which is similar to Javascript objects and is widely supported by other programming languages, including Ruby. JSON’s main advantage over XML is simpler syntax, which makes it easier to read by human and it's faster(parsing is faster and it's smaller so it's faster in transmission over the Internet). Thanks to built-in support for JSON, creating response in this format in Ruby on Rails is very easy:

    Open your app/controllers/api/v1/vendors_controller.rb and type in:
    ```rubyonrails
    def index
      render json: Vendor.all
    end
    ```

    And you're done, your endpoint now delivers JSON.

    In terminal, type:

    ```Bash
    rails s
    ```

    If your port is 3000, then visit localhost:3000/app/v1/vendors and you should receive back JSON data.  
    You can also visit localhost:3000/app/v1/vendors.json
