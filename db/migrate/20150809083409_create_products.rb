class CreateProducts < Migration::TableMigration
  def change
    create_table :products do |t|
      t.string    :title,       :null => false
      t.text      :description, :null => false
      t.string    :image_url,   :null => false
      t.monetize  :price,       :null => false
    end
  end
end
