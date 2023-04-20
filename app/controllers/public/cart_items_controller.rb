class Public::CartItemsController < ApplicationController
    # before_action :authenticate_customer!
    before_action :set_cart_item, only: [:increase, :decrease, :destroy]

  def index
    @cart_items = current_customer.cart_items.all
  end


  def create
    @cart_item = current_
  end

end
