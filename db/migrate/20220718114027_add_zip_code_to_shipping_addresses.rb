class AddZipCodeToShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :shipping_addresses, :zip_code, :string
  end
end
