class RemoveZipFromShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :shipping_addresses, :zip, :string
  end
end
