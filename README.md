#### Unit Testing with Minitest, Debugging, Using the Pry gem, ActiveRecord Validations

If you've never used pry or a debugger before... this is going to be a treat.

## Let's Learn how to write Unit Tests

**What are Unit Tests?**

From Wikipedia:
> "Unit testing is a software development process in which the smallest testable parts of an application, called units, are individually and independently scrutinized for proper operation."

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

2. So notice how the test classes inherit from ActiveSupport::TestCase which includes Minitest::Assertions, which allows
    us to use minitest assertions in our tests. Remember that:

    > Any method defined within a class inherited from Minitest::Test (which is the superclass of ActiveSupport::TestCase) that begins with test_ (case sensitive) is simply called a test. So, test_password and test_valid_password are legal test names and are run automatically when the test case is run.

    > Rails adds a test method that takes a test name and a block. It generates a normal Minitest::Unit test with method names prefixed with test_.

3. Let's write our first test:

    ````rubyonrails
    test "A vendor is valid with a name" do
      vendor = Vendor.create(name: "Jeff")

      assert vendor.valid?
      refute vendor.invalid?
    end
    ````

    So what is all of this? Why do we test? What is the point of this?
    Well, in my opinion, testing serves two purposes:
    * it serves as documentation for your code. Tests make it very clear to your reader what your app is supposed to do and not do.
    * You have a way to verify your app still works even after you make massive changes. Sometimes, changes to your app may break your app and so you want to have tests to ensure that you didn't break your app unexpectedly.

    In this case, all that we're testing in this case is that a Vendor that we create with a name of "Jeff" is valid. You should have some questions right now like:  
    * What does the create method do?  
    * What does the valid? method do?
    * What is assert?

    create method:  
    [create](http://guides.rubyonrails.org/active_record_basics.html#create)

    valid? method:  
    [valid](http://api.rubyonrails.org/classes/ActiveRecord/Validations.html)
    The important thing is that an ActiveRecord object is valid if it has no errors. If there are no errors in the object, object.valid? returns true. object.errors should be empty. We will see what this means shortly and we will see what validations are shortly.

    assert? method (from Minitest):  
    [assert](http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest/Assertions.html#method-i-assert)

    So in this test, we have a variable called vendor and we set it to a Vendor object which is created with the create method which both instantiates a new Ruby object with attributes that are determined from the model's table and then saves it to the database using some ActiveRecord ORM magic. Think of the "create" method as a combination of the "new" method and the save method in ActiveRecord. Here's a quote about the "new" method:

    > New objects can be instantiated as either empty (pass no construction parameter) or pre-set with attributes but not yet saved (pass a hash with key names matching the associated table column names). In both instances, valid attribute keys are determined by the column names of the associated table — hence you can‘t have attributes that aren‘t part of the table columns

    Since there are no validations, we successfully create a vendor (new + saved to database), and vendor is by definition valid (since it saved to the database, it had no errors. An object can only be saved to the database if it's valid/has no errors. So, since it saved successfully to the database as a result of the create method, it is valid.) I'll explain how errors are generated shortly.

    Lastly,
    * tests that begin with assert only pass if the argument provided is truthy (anything but false or nil).
    * tests that begin with refute only pass if the argument provided is falsey (false or nil).

2. Let's write a second test. Let's test that a vendor is not valid without a name:  
    Here is the test:

    ```rubyonrails
    test "a vendor is not valid without a name" do
      vendor = Vendor.create(name: "Jeff")
      vendor.name = nil
      vendor.save

      assert vendor.invalid?
      refute vendor.valid?
    end
    ```

    In terminal, run:
    ```Bash
    rake
    ```

    So this test fails right now. You'll see a failure on the line with the "assert" in it. Currently, vendor is valid even if we set the name to nil. Believe me? You shouldn't. Let's see for yourself.

    In your Gemfile (at the parent level of your app, at the bottom), add:
    ```rubyonrails
    gem 'pry'
    ```

    Let's debug like a boss.  
    After you add the pry gem, run this in your terminal:  
    ```Bash
    bundle
    ```

    Then, add this "require 'pry';binding.pry" line to your test:  
    ```rubyonrails
    test "a vendor is not valid without a name" do
      vendor = Vendor.create(name: "Jeff")
      vendor.name = nil
      vendor.save
      require 'pry'; binding.pry
      assert vendor.invalid?
      refute vendor.valid?
    end
    ```

    Then, run this in your terminal:
    ```Bash
    rake
    ```

    You should stop at that binding.pry in your terminal. Your terminal should look like:

    > From: /Users/Jwan/Dropbox/programming/andela/api_rails_tutorial/test/models/vendor_test.rb @ line 14 VendorTest#test_a_vendor_is_not_valid_without_a_name:

    > 10: test "a vendor is not valid without a name" do
      11:   vendor = Vendor.create(name: "Jeff")
      12:   vendor.name = nil
      13:   vendor.save
    > 14:   require 'pry' ; binding.pry
      15:   assert vendor.invalid?
      16:   refute vendor.valid?
      17: end

    > [1] pry(#<VendorTest>)>

    Type in your terminal:

    > vendor

    then hit enter. What do you see? It looks like an object. Because of pry, you have access to all the variables in your current binding, which includes vendor. It evaluates the variable vendor in the context of the current binding.

    Type in your terminal:

    > vendor.errors

    What do you see?

    Type in:

    > vendor.errors.empty?

    What does empty? do? Look it up.

    Type in:

    > vendor.valid?

    What do you see? Since it's valid, our test testing that it is invalid will fail.

    It fails because:

    > vendor.save

    returns true because:

    > vendor.errors.empty?

    is true.

    Let's get our tests to pass. In terminal, type:
    ```Bash
    exit
    ```

    Open up your app/models/vendor.rb file and let's add some validations.

    Inside the Vendor class, type in:

    ```rubyonrails
    validates :name, presence: true,
    ```

    Read this:  
    [presence](http://guides.rubyonrails.org/active_record_validations.html#presence)

    [saving to database](http://guides.rubyonrails.org/active_record_validations.html#when-does-validation-happen-questionmark)
    > When you create a fresh object, for example using the new method, that object does not belong to the database yet. Once you call save upon that object it will be saved into the appropriate database table.

    [valid? or invalid?](http://guides.rubyonrails.org/active_record_validations.html#valid-questionmark-and-invalid-questionmark)
    > valid? triggers your validations and returns true if no errors were found in the object, and false otherwise.

3. Make these tests pass, add them to your test files:  

    ```rubyonrails
    # this is your vendor_test.rb file
    require 'test_helper'

    class VendorTest < ActiveSupport::TestCase
      test "A vendor is valid with a name" do
        vendor = Vendor.create(name: "Jeff")
        assert vendor.valid?
        refute vendor.invalid?
      end

      test "a vendor is not valid without a name" do
        vendor = Vendor.create(name: "Jeff")
        vendor.name = nil

        refute vendor.errors.empty?
        assert vendor.invalid?
        refute vendor.valid?
      end

      test "a vendor is not valid without name, using new method" do
        vendor = Vendor.new(name: nil)

        assert vendor.invalid?
        refute vendor.valid?
      end

      test "a vendor can have a name that is between 2 and 20 characters long" do
        vendor1 = Vendor.create(name: "a")
        vendor2 = Vendor.create(name: "four")
        vendor3 = Vendor.create(name: "ThisNameIsThirtyLength30303030")

        assert vendor1.invalid?
        assert vendor3.invalid?
        assert vendor2.valid?
      end

      test "vendors have to have unique names" do
        vendor1 = Vendor.create(name: "jeff")
        vendor2 = Vendor.new(name: "jeff")

        vendor1.valid?
        vendor2.invalid?
      end

      test "a vendor can have many suyas" do
        vendor = Vendor.create(name: "Jeff")
        beef_suya = Suya.create(meat: "beef", spicy: true)
        kidney_suya = Suya.create(meat: "kidney", spicy: false)

        vendor.suyas << beef_suya
        vendor.suyas << kidney_suya

        assert_equal 2, vendor.suyas.count
      end

      test "a vendor can have many suyas, another way with arrays" do
        vendor = Vendor.create(name: "Jeff")
        beef_suya = Suya.create(meat: "beef", spicy: true)
        kidney_suya = Suya.create(meat: "kidney", spicy: false)

        vendor.suyas = [beef_suya, kidney_suya]

        assert_equal 2, vendor.suyas.count
      end
    end

    ```

    and add this to your suya_test.rb file. Make it pass:

    ```rubyonrails
    require 'test_helper'

    class SuyaTest < ActiveSupport::TestCase
      test "suya is valid with a meat and spicy" do
        suya = Suya.new(meat: "beef", spicy: true)

        assert suya.valid?

        suya.save

        assert_equal 1, Suya.count
      end

      test "suya is not valid without a meat" do
        suya = Suya.new(meat: nil, spicy: true)

        assert suya.invalid?
        refute suya.valid?
      end

      test "suya is not valid without a spiciness level" do
        suya = Suya.new(meat: "beef", spicy: nil)

        assert suya.invalid?
      end

      test "suya belongs to a vendor" do
        vendor = Vendor.create(name: "jeff")
        suya = Suya.create(meat: "beef", spicy: true)

        suya.vendor = vendor

        refute suya.vendor.blank?
        assert_equal "jeff", suya.vendor.name
      end
    end

    ```

Make them pass. Use pry often. Good luck. Check our my code if you need to. If you see errors, google them.
