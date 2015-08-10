class CreateLineItems < Migration::TableMigration
  def change
    create_table :line_items do |t|
      t.references  :product,  :null => false, :index => true
      t.references  :cart,     :null => false, :index => true
      t.integer     :quantity,    :null => false, :default => 1
    end
    add_index(:line_items, [:product_id, :cart_id], :unique => true)
    add_foreign_key :line_items, :products
    add_foreign_key :line_items, :carts
  end
end
