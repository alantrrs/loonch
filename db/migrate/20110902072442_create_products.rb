class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :bar_code
      t.string :name
      t.string :image, :default => "products/0000000000000-01-02-01.jpg"
      t.float :content
      t.string :content_units
      t.string :sale_units
      t.float :equivalence
      t.boolean :ingredient
	  t.integer :category_id
      t.timestamps
    end
  end
end
