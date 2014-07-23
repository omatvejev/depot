Notes C: Catalog Display
====================================

Take Aways Points:
------------------
* app/view/layouts/application.html.erb file contains the global layout of the site which will be used by all the views. The yield function allows view HTML to be loaded.

* Inside the app/view/layouts/application.html.erb the stylesheet_link_tag() helper method is used to generate a <link> tag to our application's stylesheet and specifies an option to enable turbolinks. Turbolinks work behind the scenes to speedup up page changes within the application

* Similar to above, javascript_include_tag is used to generate a <link> to the application's scripts

* Inside the app/view/layouts/application.html.erb csrf_meta_tags() method is used to prevent XSS forgery attacks

* Both validation and functional tests will test the behavior of the controllers only. Therefore, they will not retroactively affect any objects that already exist in the database or in fixtures.

* Modify config.action_controller.perfomr_caching = true in the config/environments/development.rb to enable caching in a development mode

Code:
-----
* We can modify the root URL of the site by adding the following to the routes.rb file
```ruby
root 'store#index', as: 'store'
```

* We can order our model results by using the order method.
```ruby
Product.order(:title)
```

* We can display HTML tags in a view by calling the following method: (Warning! can create XSS vulnerability)
```ruby
sanitize
```

* You can generate HTML image tags by using the following code:
```ruby
image_tag("logo.png")
```

* We can format the price as currency using rails built in helper. There are various parameters associated with this method.
```ruby
number_to_currency()
```

* We can assert specific tags inside the functional tests by using assert_select(tag, value) and check if they have the appropriate values. The value can be a string, number, regular expression and much more
```ruby
assert_select( tag, value )
```

* To pull the latest data from the database we can use the following call:
```ruby
Product.order(:updated_at).last
```

* You can cache items in the view by using this method:
cache ['store', Product.latest]

Commands:
---------
* Test controllers
> rake test:controllers

CSS Snippet:
---------
IDs:
* Each element can have only one ID
* Each page can have only one element with that ID

Classes:
* You can use the same class on multiple elements.
* You can use multiple classes on the same element.
