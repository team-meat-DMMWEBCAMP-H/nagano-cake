class Public::OrdersController < ApplicationController
  # ↓ログイン済みの顧客のみにアクセスを許可　確認できないため現在はコメントアウト
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = Customer.select('address')
  end
  
  def confirm
  @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find([:order][:address_id])
      @order.zip_code = @address.zip_code
      @order.address = @address.address
      @order.name = @address.name
    end
    @order_detail = OrderDetail.new
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
  end

  def complete
  end

  def index
  end

  def show
  end
  
  
  private
  
  def order_params
    params.require(:order).permit(:zip_code, :address, :name, :customer_id, :total_price)
    .merge(payment_method: convert_payment_method(params[:order][:payment_method]))
  end

  def convert_payment_method(payment_method)
    case payment_method
    when "クレジットカード"
      0
    when "銀行振込"
      1
    end
  end
end