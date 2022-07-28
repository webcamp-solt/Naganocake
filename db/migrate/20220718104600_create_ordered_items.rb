class CreateOrderedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.integer :production_status, default: 0, null: false
      t.integer :tax_price, null: false

      t.timestamps
    end
  end
end
