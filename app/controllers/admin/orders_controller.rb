class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
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
    @details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @details.update_all(production_status: 1)if @order.status == "製作中"
    end
      redirect_to admin_order_path(@order)
  end

private
  def order_params
    params.require(:order).permit(:status)
  end
end