class CreateSales < Migration::TableMigration
  def change
    create_table :sales do |t|
      t.integer :discount, :null => false, :default => 5
      t.integer :quantity, :null => false, :default => 1
      t.string  :title,    :null => false
    end
  end
end
