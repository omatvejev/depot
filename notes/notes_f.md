Notes F: Add a Dash of Ajax
====================================

Take Aways Points:
------------------
* Partial (start with an underscore) is a chunk of a view code that is located in a separate file and can be invoked in another template or controller. You can also, pass parameters to partials using locals.
* We can pass a collection to the method that renders partial templates. The partial method will then automatically invoke the partial on each of items in the collection. Note: Inside the partial template, we refer to the current object using the variable name that matches the name of the template.
* We can manipulate Document Object Model (DOM) to change the displayed HTML in front of the user's eyes using JavaScript.
* To render a JavaScript template add the format.js to the rendering code. The JavaScript code is then placed in app/views/*/*.js.erb
* Whenever we want to abstract some processing out of a view (any kind of view) we should write a helper method and put them in the app/helpers directory.

Code:
-----
To send an Ajax request when pressing a button add the remote: true parameter to the button_to method call
```ruby
button_to 'Add to Cart', line_items_path(product_id: product), remote: true
```

We can replace the content of the element whose id = "cart" with the following JS code: (Note: escape_javascript() helper method converts Ruby string into a format acceptable by JavaScript)
```js
$('#cart').html("<%= escape_javascript render(@cart) %>");
```

To add a fade out effect we can use jQuery UI library and calling the following code:
```js
$('#current_item').css({'background-color':'#88ff88'}).animate({'background-color':'#114411'}, 1000);
```
The code above will take the element with id = "current_item" setting its css background-color to a new color. Then the followed animate() method class transitions the css back to the original state over a period of 1000ms.

We can reveal an element in a smooth manner by running the following JS code:
```js
$('cart').show('blind', 1000);
```

The content_tag() method can be used to wrap the output created by a block in a tag. Ex: The below code will wrap the block in a div tag.
```ruby
content_tag('div', attributes, &block)
```

We can add an ability to execute a script when an image is clicked
```js
$(document).on "ready, page:change", ->
  $('.store .entry > img').click ->
    $(this).parent().find(':submit').click()
```
- The first line defines a function using the -> operator and then passes it to the 'on' function. The 'on' function is associated with two events: ready and page:change.
  - ready is the event that fires up when people navigate to your page from outside of your site.
  - page:change is the event that uses Turbolinks and occurs when people navigate to your page from within your site
- The second line finds all the images that are immediate children of elements that are defined with the class = "entry", which themselves are descendants of an element with class = "store". The click part is indicating that for each image found, which could be zero when run against other pages in our application, a function is defined that is associated with the click event for that image.
- The third line process the click event. It starts with the element on which the event occurred, namely, 'this'. It then proceeds to find the parent element, which will be a div that specifies class = "entry". Within that element we find the submit button, and we proceed to click it.

We can send an XHR (XML-HttpRequest) request in our tests by doing the following: 
```ruby
xhr :post, :create, product_id: products(:ruby).id
```

When we call a jQuery action we expect our HTML to be replaced. This is achieved by applying the assert_select_jquery() to extract the relevant HTML and then processing that HTML via whatever additional assertions you want to apply
```ruby
assert_select_jquery :html, '#cart' do
  assert_select 'tr#current_item td', /Programming Ruby 1.9/
end
```

Commands:
---------

Installing jQuery UI library:
-----------------------------
1) Add the following to the Gemfile:
```ruby
gem 'jquery-ui-rails'
```

2) Do bundle install in terminal on the the project directory

3) Add the following to the app/assets/javascript/application.js
```ruby
//= require jquery.ui
```
