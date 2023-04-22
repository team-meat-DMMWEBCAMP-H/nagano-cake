class Public::OrdersController < ApplicationController
  # ↓ログイン済みの顧客のみにアクセスを許可　確認できないため現在はコメントアウト
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = Customer.select('address')
  end

  def complete
  end

  # 注文情報入力確認画面
  def confirm
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
       @order.zip_code = current_customer.zip_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
        ship = Customer.select('address')
        @order.zip_code = ship.zip_code
        @order.address = ship.address
        @order.name = ship.name

    elsif params[:order][:address_option] = "2"
        @order.zip_code = params[:order][:zip_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    else
            render 'new'
    end

        @cart_items =current_customer.cart_items.all
        @order.customer_id = current_customer.id

  end

  # 注文情報保存
  def create
        @order = Order.new(order_params)
        @order.customer_id = current_member.id
        @order.save

        current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
          @ordered_item = OrderDetail.new #初期化宣言
          @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
          @ordered_item.quantity = cart_item.quantity #商品の個数を注文商品の個数に代入
          @ordered_item.tax_price = (cart_item.item.price*1.1).floor #消費税込みに計算して代入
          @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
          @ordered_item.save #注文商品を保存
        end

        current_customer.cart_items.destroy_all
        redirect_to order_complete_path
  end

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postage, :payment_method, :name,:address,:zip_code,:customer_id,:billing_amount,:status)
  end

end