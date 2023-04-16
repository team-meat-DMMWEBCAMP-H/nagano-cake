class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # ↓カート内商品と商品のアソシエーション(多対多)
         has_many :cart_items, dependent: :destroy
         has_many :items,through: :cart_items
        # ↓注文とのアソシエーション(1対N)
         has_many :orders
        # 配送先とのアソシエーション(1対N)
         has_many :shipping_addresses,dependent: :destroy
end
