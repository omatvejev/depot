Notes D: Cart Creation
====================================

Take Aways Points:
------------------

* belogs_to() method allows us to specify foreign key constrains in our model. We can access the foreign key referenced object by calling the key.

* has_many() reverse of belongs_to(), telling that the caller model has access to many entries of the referenced model.

* In rails new() is used to get a form, which is used to solicit input for a subsequent create() action.

* params object holds all the passed parameters in Rails

Code:
-----

* We can extend the include module pattern by giving it additional functionality such as extending a class methods, including instance methods and applying configuration. To do this add the following to the module.
```ruby
extend ActiveSupport::Concern
```
(For more information: http://www.schneems.com/post/21380060358/concerned-about-code-reuse/)

* We can destroy all the has_many() referenced model's object when the caller model object is destroyed by adding the following constraint:
```ruby
has_many :line_items, dependent: :destroy
```

* We can add a hook to a method that is called before the object is destroyed. If the hook method returns false the object will not be destroyed.
```ruby
before_destroy :ensure_not_referenced_by_any_line_items
```

* To directly access the error object and add our own errors use the following:
```ruby
errors.add(:base, 'Line Items present')
```

* To add a button which uses POST method we can use the following helper:
```ruby
button_to 'Add to Cart', line_items_path(product_id: product)
```

* We can use a before_action callback inside the controller to call a method before the controller is executed.
```ruby
before_action :set_line_items, only: [:show, :edit, :update, :destroy]
```

* Rails can establish connection between references by calling build method from either ends. In the below case we are building a new line item relationship between the @cart object and the product.
```ruby
@line_item = @cart.line_items.build(product: product)
```

* Assigns method gives us access to the instance variables that have been (or can be) assigned by controller actions for use in views.
```ruby
assigns(:line_item)
```
