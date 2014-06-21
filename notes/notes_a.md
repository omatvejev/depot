Notes A: Basic Setup
====================

Take Away Points:
------------------
* Models are objects (singular: product.rb) that are mapped to a relational database (plural: Products). This is where most of the database related business logic occurs.

* Controllers (plural: products_controller.rb) are in charge of routing and communicating with the model. Controllers have a view associated to each of the methods. By default controllers have the following methods: index, show, new, edit, create, update, and destroy.

* Database information is stored in the config/database.yml

* Migrations are the changes that you want to make to the database. Migrations have a UTC time stamp which determines the order that they should be ran in. You can also apply or remove migrations.

* db/seeds.rb is used to store a preset database data that other developers can use.

* .erb files are used to display content. You can have both ruby code and HTML tags inside an .erb files.

* .scss used to store css 

* rails will run any new change inside the .erb and .scss files as soon as you refresh the page in the developer mode.

* When we use http://localhost:3000/products/new the call the the new method in the controller invoked. At this point the controller renders the the new.html.erb. Inside the new.html.erb we have <%= render 'form' %> thats tells the server to render the _form.html.erb. When we click on the submit form button we go to the create function in controller. At this point the product is saved with the form parameters and we are redirects to the products/1 this corresponds to the show method in the controller. We then render the show.html.erb view.

* app/views/layouts/application.html.erb - Used to create a standard page environment for the entire application. Due to the <%= yield %> call we can run other views. Note: All scss files are loaded here at once as well. 

* Sample controller for Products

| Controller Method |   Request   |        Path      |
| ----------------- | ----------- | ---------------- |
|       index       |   GET       | /products        |
|       show        |   GET       | /products/1      |
|       new         |   GET       | /products/new    |
|       edit        |   GET       | /products/1/edit |
|       create      |   POST      | /products        |
|       update      |   PATCH/PUT | /products/1      |
|       destroy     |   DELETE    | /products/1      |

Code:
-----
* Alternative syntax for writing long double quoted strings:
```ruby
%{string}
```

* Method will raise validation errors if the data cannot be inserted to the database (possibly due to the validation in the model)
```ruby
create!
```

* Since app/views/layouts/application.html.erb loads all the css at once this allows to limit the controller to only the controller specific pages
```ruby
<body class='<%= controller.controller_name %>'>
```

* Method that links to the /products/productId/edit
```ruby
link_to 'Edit', edit_product_path(product)
```

* Allows you to cycle through entries changing their look in the css
```ruby
<tr class="<%= cycle('list_line_odd', 'list_line_even') %>">
```

* Truncates a string to the specified number of characters
```ruby
truncate(string, num)
```

* Strips out all the html tags
```ruby
strip_tags()
```

* Renders a file named _form.html.erb
```ruby
<%= render 'form' %>
```

* Renders the <img> tag to the specified file. By default files are loaded from public/images
```ruby
<%= image_tag "header.png" %> 
```

Commands:
---------
* Creates a new rails application by the name depot 
> rails new depot 

* Generates the model, view, controller, and migration for our products table. To sum it up this command generates a ready to use code and a migration with the specified attributes.
> rails generate scaffold Product title:string description:text image_url:string price:decimal

* Generating a Controller 
> rails generate model Product [params]

* Generating a Model
> rails generate controller Products [params]

* Generate a Migration
> rails generate migration CreateProductsTable [params]

* Rake will automatically apply all the migrations that haven't been applied to the database yet. 
> rake db:migrate

* To rollback the database
> rake db:rollback

* To start a ruby server. User localhost:3000 to connect to it
> rails server

* To run the tests
> rake test

* To execute seeds
> rake db:seed