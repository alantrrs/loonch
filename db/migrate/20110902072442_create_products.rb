class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
	  t.string :sale_units
	  t.integer :category_id
      t.timestamps
    end
  end
end
