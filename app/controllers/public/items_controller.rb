class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(10)#新しい順の商品一覧
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private
  def item_params
  params.require(:items).permit(:genre_id,:name,:introduction,:price,:item_image)
  end

end