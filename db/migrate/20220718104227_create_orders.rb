class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :items_total, null: false
      t.integer :order_status, default: 0, null: false
      t.integer :payment_method, default: 0, null: false
      t.string  :zip_code, null: false
      t.string  :address, null: false
      t.string  :name, null: false
      t.integer :delivery_money, null: false

      t.timestamps
    end
  end
end
