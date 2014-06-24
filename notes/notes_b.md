Notes B: Validation and Unit Testing
====================================

Take Aways Points:
------------------
* The validates methods can be added to the model to validate the integrity of the data before it is saved to the relational database.

* test/models/ contains the model unit tests which are part of the MiniTest::Unit::TestCase class a framework that comes pre-installed with rails.

* In testing, the assert() method checks if an expression returns true. If the assert returns false then the assertion fails and MiniTest framework will return a failure message stopping the execution of that particular test. Asserts can also have an optional string parameter that will be displayed if assertion fails.

* Fixtures, stored in test/fixture YAML format, are a preset test data that our tests can use. Each fixture file contains data for a single model and the file name is significant; the base name of the file must match the name of a database table (table: products fixture: products.yml). Fixtures are loaded to the corresponding database table before each test method in the test case is run. So, during each method execution all the fixtures are reloaded.

Code:
-----
* Makes sure that title, description and image url have some data before the object is saved to the relational database/
```ruby
validates :title, :description, :image_url, presence: true
```

* Makes sure that the price is a number that greater or equal to 0.01
```ruby
validates :price, numericality: {greater_than_or_equal_to: 0.01}
```

* Makes sure that the title is unique
```ruby
validates :title, uniqueness: true
```

* We match the field against the regular expression. %r{pattern} is the same as /.../ but allows the usage of / unescaped. The .(gif|jpg|png) tells us to match the string to .gif or to .jpg or to .png with the \Z indicating that we are looking at the end of the string. The i tells us that the match is case insensitive. Finally, we use allow_blank option to avoid getting multiple error messages when the file is blank
```ruby
validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png\Z)/i,
    message: 'must be a URL for GIF, JPG or PNG image'
```

* Called before any of tests are executed. Used inside the test classes.
```ruby
setup do
end
```

* To check if there are any validation errors we can call invalid? method and then use any? method of the error list to check if there is an error associated to a particular attribute.
```ruby
product invalid?
product.errors[:title].any?
```

* To import a fixture into your unit test you can add the following to the test class. However, by default rails already imports all the fixtures.
```ruby
fixtures :products
```

* A method with the same name as the fixture is created automatically in the test files that can be used to access the preloaded model objects containing the fixture data.
```ruby
products(:ruby).title
```

* We can avoid using hard-coded string for the Active Record error, by comparing the response against its built-in error message table.
```ruby
assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
```

Commands:
---------
* Test models
> rake test:models
