class Item < ApplicationRecord

  has_one_attached :item_image

  has_many :order_details
  has_many :cart_items
  belongs_to :genre

  def add_tax_price
      (self.price * 1.10).round
  end

  def get_image
    (item_image.attached?) ? item_image : 'no-image.jpg'
  end
  
  def with_tax_price
    add_tax_price.to_s(:delimited)
  end
end
