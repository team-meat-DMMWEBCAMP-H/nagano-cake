class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer!
  before_action :set_cart_item, only: [:increase, :decrease, :destroy]
 def index
  @crat_items = current_customer.cart_items
 end



 # ↓カートへの商品の追加 or すでにカート内に存在する商品の個数の更新
 def create
  increase_or_create(params[:cart_item][:item_id])
  redirect_to cart_item_path
 end


 # カート内商品の個数を1増やす
 def increase
  @cart_item.increment!(:quantity, 1)
  redirect_to request.referer
 end

 # カート内商品の個数を1減らす or カート内商品を削除する
 def decrease
  decrease_or_destroy(@cart_item)
  redirect_to request.referer
 end

 def destroy
  @cart_item.destroy
  redirect_to request.referer
 end


 private


 def set_cart_item
  @cart_item = current_customer.cart_items.find(params[:id])
 end

 def increase_or_create(item_id)
  cart_item = current_customer.cart_items.find_by(item_id:)
  if cart_item
   cart_item.increment!(:quantity, 1)
  else
   # カート内商品を新たに作成
   current_customer.cart_items.build(item_id:).save
  end
 end



 def decrease_or_destroy(cart_item)
  if cart_item.quantity > 1
   cart_item.decrement!(:quantity, 1)
  else
   cart_item.destroy
  end
 end

end