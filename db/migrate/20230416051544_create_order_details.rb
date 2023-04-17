class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :order_id,            null: false
      t.integer :item_id,             null: false
      t.integer :quantity,            null: false
      t.integer :production_status,   null: false, default: "0"
      t.integer :tax_price,           null: false
      t.timestamps
    end
  end
end