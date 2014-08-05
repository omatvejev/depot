Notes E: A Smarter Cart
====================================

Take Aways Points:
------------------

* In migrations up() method is used when we migrating and down() when we are rolling back the migration. It is a good idea to make each migration reversible. (Note: change() implements both up() and down() automatically for certain operations such as: adding a new column)

* A flash is a bucket in which we can store stuff as we process a request. The contents of the flash are available to the next request in this session before being deleted automatically. Typically the flash is used to collect error messages.

* Every controller has a logger attribute that can be used to record errors. The log can then be seen in log/development.log 

Code:
-----
* find_by() method is a streamlined versions of where() method but instead of returning an array of results, it returns either an existing LineItem or nil.
```ruby
line_items.find_by(product_id: product_id)
```

* We can add a custom method that is called before the record is destroyed.
```ruby
before_destroy :ensure_not_referenced_by_any_line_items
```

* We can group the results from a query. For instance below we get a sum of the quantity fields for each of the line items associated with this cart, grouped by product_id.
```ruby
sums = cart.line_items.group(:product_id).sum(:quantity)
```

* We can rescue our controller from exceptions by using a rescue callback. Example: When a cart doesn't exist and ActiveRecord::RecordNotFound is raised the invalid_cart method will be called.
```ruby
rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
```

Commands:
---------
* Generating a migration. Rails recognizes the patterns add_XXX_to_Table and remove_XXX_from_TABLE, where the value of XXX is ignored; what matters is the list of column names and types that appear after the migration name.
> rails generate migration add_quantity_to_line_items quantity:integer

* To rollback the previous migration
> rake db:rollback

* To view migration status
> rake db:migrate:status

* Unix tail command can be used to view the development logs
> tail -f log/development.log

* To clear the test logs run the following command
> rake log:clear LOGS=test

product_path vs product_url:
---------------------------
* When you use product_url you'll get everything including protocol and domain name. You should be using product_url when doing redirect_to because the HTTP spec requires a full qualified URL when doing 302 Redirect and friends. You also need the full URL if you're redirecting from one domain to another, like product_url(domain: "example2.com", product:product).

* The rest of the time, you can use product_path. This will generate only the /products/1 part, and that's all you need when doing links or pointing forms, like link_to "My loveley product", product_path(product).
