class Public::OrdersController < ApplicationController
  # ↓ログイン済みの顧客のみにアクセスを許可
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def complete
  end

  def index
  end

  def show
  end
end
