class Item < ApplicationRecord

  has_one_attached :item_image

  has_many :order_details
  has_many :cart_items
  belongs_to :genre


  def get_image(width, height)

  end
end
