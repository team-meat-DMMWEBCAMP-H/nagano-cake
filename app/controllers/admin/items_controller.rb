class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :sale_status, :image)
  end

end
