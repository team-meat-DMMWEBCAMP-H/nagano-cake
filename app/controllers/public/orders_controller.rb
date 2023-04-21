class Public::OrdersController < ApplicationController
  # ↓ログイン済みの顧客のみにアクセスを許可　確認できないため現在はコメントアウト
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = Customer.select('address')
  end

  def complete
  end

  def index
  end

  def show
  end
end