class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)#新しい順の商品一覧
  end

  def show
    @item = Item.find(params[:id])
  end

  def item_params
　　params.require(:items).permit(:genre_id,:name,:introduction,:price,:item_image)
  end
end