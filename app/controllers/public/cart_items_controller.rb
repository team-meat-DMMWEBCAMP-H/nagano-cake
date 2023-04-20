<<<<<<< HEAD
class Public::ItemsController < ApplicationController
=======
class Public::CartItemsController < ApplicationController
    # before_action :authenticate_customer!

>>>>>>> 29c80d4a76569bc1029778be5531a30e6656401f
  def index
    @items = Item.all.order(created_at: :desc)#新しい順の商品一覧a
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


<<<<<<< HEAD
  private
  def item_params
  params.require(:items).permit(:genre_id,:name,:introduction,:price,:item_image)
  end

<<<<<<< HEAD
end
=======
=======
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
                          #元々カート内にあるもの「item_id」
                          #今追加した　　　　　　　params[:cart_item][:item_id])
            cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
            cart_item.quantity += params[:cart_item][:quantity].to_i
           #cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
                                                              #.to_iとして数字として扱う
            cart_item.save
            redirect_to cart_items_path

        # もしカート内に「同じ」商品がない場合は通常の保存処理
    elsif @cart_item.save
            @cart_items = current_customer.cart_items.all
            render :index
    else# 保存できなかった場合
            render :index
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :price, :quantity)
    end


>>>>>>> 29c80d4a76569bc1029778be5531a30e6656401f


end
>>>>>>> 04917b26690084a07cc18360e97530cfde50b5a2
