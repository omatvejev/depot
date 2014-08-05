require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add unique products to cart" do
    cart = carts(:current_cart)
    assert_difference('cart.line_items.count', 2) do
      cart.add_product(products(:ruby)).save!
      cart.add_product(products(:coffescript)).save!
    end
  end

  test "add duplicate products to cart" do
    cart = carts(:current_cart)
    assert_difference('cart.line_items.count', 1) do
      cart.add_product(products(:ruby)).save!
      cart.add_product(products(:ruby)).save!
    end
  end
end
