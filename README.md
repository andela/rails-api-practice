## Testing APIs

#### Instructions

If you are starting at this point in the tutorial, clone down the repo and follow the instructions in the **Let's Begin** section

Again, the order of this tutorial is:

1. setting-up-rails-api
2. unit-testing-models-and-bottles
3. creating-api
4. testing-api


#### Let's Begin

In your test/controllers/api/v1 folder, open up the vendors_controller_test.rb.  
We're first going to test our index endpoint that returns back all of the vendors.

```rubyonrails
test "the index action returns back json of all vendors" do
  jeff = Vendor.create(name: "Jeff")
  obie = Vendor.create(name: "Obie")
  jeremy = Vendor.create(name: "Jeremy")

  get :index
  vendors = JSON.parse(response.body)

  assert_equal 3, vendors.count
  assert_equal "Jeff", vendors[0]
  assert_equal "Obie", vendors[1]
  assert_equal "Jeremy", vendors[2]
end
```

FYI, I like separating my tests into 3 sections:

1. the setup (this is where I create test fixtures)
2. the actions of the test
3. the tests themselves

I separate each section of the test which makes my tests more readable.

A few points I want to first go over about this test:

1. the "get" action is explained well in the edgeguides:

    > Rails simulates a request on the action called index, making sure the request was successful and also ensuring that the right response body has been generated.

    > The get method kicks off the web request and populates the results into the response. It accepts 4 arguments:

    > The action of the controller you are requesting. This can be in the form of a string or a symbol.

    > params: option with a hash of request parameters to pass into the action (e.g. query string parameters or article variables).

    > session: option with a hash of session variables to pass along with the request.

    > flash: option with a hash of flash values.

    > All the keyword arguments are optional.

    [controller tests](http://edgeguides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)  

    The get method simulates an HTTP request.


2. The controller that we're testing is automatically inferred. When we created the controller, a controller test was created   for us and it inherits from ActionController::TestCase.

    > ActionController::TestCase will automatically infer the controller under test from the test class name. If the controller cannot be inferred from the test class name, you can explicitly set it with tests.

    > class SpecialEdgeCaseWidgetsControllerTest < ActionController::TestCase
      tests WidgetController
    end

    [more on controller tests](http://api.rubyonrails.org/classes/ActionController/TestCase.html)

3. The response object represents the response of the last HTTP response. In the above example, @response becomes valid after calling "get". If the various assert methods are not sufficient, then you may use this object to inspect the HTTP response in detail.
