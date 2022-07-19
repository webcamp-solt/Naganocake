class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string  :name, null: false
      t.text    :description, null: false
      t.integer :price, null: false
      t.boolean :sale_status, default: true

      t.timestamps
    end
  end
end
