class StoreController < ApplicationController
  include CurrentCart
  include CurrentCounter
  before_action :set_cart
  before_action :set_counter, only: [:index]

  def index
    @products = Product.order(:title)
    update_counter
  end
end
