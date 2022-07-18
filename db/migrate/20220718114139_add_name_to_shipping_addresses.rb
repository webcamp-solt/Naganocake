class AddNameToShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shipping_addresses, :name, :string
  end
end
