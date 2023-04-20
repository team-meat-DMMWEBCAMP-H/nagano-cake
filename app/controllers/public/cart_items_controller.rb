class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)#新しい順の商品一覧
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private
  def item_params
  params.require(:items).permit(:genre_id,:name,:introduction,:price,:item_image)
  end

<<<<<<< HEAD
end
=======


end
>>>>>>> 04917b26690084a07cc18360e97530cfde50b5a2
