class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order = Order.find(params[:order_id])
    @detail = OrderDetail.find(params[:id])
    @details = @order.order_details.all

    is_updated = true
    if @detail.update(order_detail_params)
      @order.update(status: 2) if @detail.production_status == "製作中"
      @details.each do |detail|
        if order_detail.production_status != "製作完了"
          is_updated = false
        end
      end
      @order.update(status: 3) if is_updated
    end
    　redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
