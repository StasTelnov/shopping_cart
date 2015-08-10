class CreateProductsSales < Migration::TableMigration
  def change
    create_table :products_sales do |t|
      t.references :product,  :null => false, :index => true
      t.references :sale,     :null => false, :index => true
    end
    add_index(:products_sales, [:product_id, :sale_id], :unique => true)
    add_foreign_key :products_sales, :products
    add_foreign_key :products_sales, :sales
  end
end
