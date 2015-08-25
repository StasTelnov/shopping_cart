class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references  :product,  :null => false, :index => true
      t.references  :cart,     :null => false, :index => true
      t.integer     :quantity, :null => false, :default => 1

      t.timestamps :null => false

      t.foreign_key :products
      t.foreign_key :carts
    end
    add_index(:line_items, [:product_id, :cart_id], :unique => true)
  end
end
