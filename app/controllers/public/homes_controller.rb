class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
    @active_items = @items.order(id: :desc).limit(4)
  end

  def about
  end
end