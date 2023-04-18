class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    @order_details = OrderDetail.all
  end

  def show
  end
end
