#### Let's Learn how to write Unit Tests

**What are Unit Tests?**

From Wikipedia:
> "In computer programming, unit testing is a software testing method by which individual units of source code"


**How do we test our units in Rails?**
From [Unit Tests from the Rails Guides](http://guides.rubyonrails.org/testing.html#unit-testing):
> "In Rails, models tests are what you write to test your models....The default test stub in test/models/article_test.rb looks like this:
>
> ```rubyonrails
> require 'test_helper'
>
> class ArticleTest < ActiveSupport::TestCase
>  # test "the truth" do
>  #   assert true
>  # end
> end
> ```
> A line by line examination of this file will help get you oriented to Rails testing code and terminology.
>
> require 'test_helper'
> As you know by now, test_helper.rb specifies the default configuration to run our tests. This is included with all the tests, > so any methods added to this file are available to all your tests.

> class ArticleTest < ActiveSupport::TestCase
> The ArticleTest class defines a test case because it inherits from ActiveSupport::TestCase. ArticleTest thus has all the
> methods available from ActiveSupport::TestCase. You'll see those methods a little later in this guide.
>
> Any method defined within a class inherited from Minitest::Test (which is the superclass of ActiveSupport::TestCase) that
> begins with test_ (case sensitive) is simply called a test. So, test_password and test_valid_password are legal test names
> and are run automatically when the test case is run.

> Rails adds a test method that takes a test name and a block. It generates a normal Minitest::Unit test with method names
> prefixed with test_. So,
>
> ```rubyonrails
> test "the truth" do
>  assert true
> end
> ```
> acts as if you had written

> ```rubyonrails
> def test_the_truth
>   assert true
> end
> ```
> only the test macro allows a more readable test name. "

So, we're going to write some model tests because they are our unit tests that will test the models in our application.

#### Instructions

1. So remember when we generated our models, it also generated some model tests. Find the test files in our test/models folder and let's open the vendor_test.rb. Notice how Rails appends \_test to the model name.

2. 
