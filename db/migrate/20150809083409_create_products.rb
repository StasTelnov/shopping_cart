class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string    :title,       :null => false
      t.text      :description, :null => false
      t.string    :image_url,   :null => false
      t.monetize  :price,       :null => false

      t.timestamps :null => false
    end
  end
end
