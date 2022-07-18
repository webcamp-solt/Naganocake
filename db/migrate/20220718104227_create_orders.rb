class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :items_total
      t.integer :order_status
      t.integer :payment_method
      t.string  :zip_code
      t.string  :address
      t.string  :name
      t.integer :delivery_money

      t.timestamps
    end
  end
end
