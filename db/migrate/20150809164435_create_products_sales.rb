class CreateProductsSales < ActiveRecord::Migration
  def change
    create_table :products_sales do |t|
      t.references :product,  :null => false, :index => true
      t.references :sale,     :null => false, :index => true

      t.timestamps :null => false

      t.foreign_key :products
      t.foreign_key :sales
    end
    add_index(:products_sales, [:product_id, :sale_id], :unique => true)
  end
end
