class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
	  t.integer  :loonch_id
	  t.integer :product_id
	  t.float :quantity
      t.timestamps
    end
  end
end
