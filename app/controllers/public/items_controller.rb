class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)#新しい順の商品一覧
  end

  def show
    @item = Item.find(params[:id])
  end
end