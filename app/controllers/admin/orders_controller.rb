class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @details =  @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @details = order.order_details
    @order.update(order_params)
  end

  def update
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: params[:id])
  if  @order.update(order_params)
      @order_details.update_all(production_status: 1) if @order.status == "payment_confirmation"
      # 注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
      # update_all *条件に一致するレコードをすべて更新
      #  参考記事 https://qiita.com/yumaon/items/e70e01851d35fe865629
  end
  redirect_to request.referer
  end

private
  def order_params
    params.require(:order).permit(:status)
  end
end
