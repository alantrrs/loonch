class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
	  t.integer :cart_id
	  t.integer :product_id
	  t.float :sale_quantity
	  t.float :lef_quantity
      t.timestamps
    end
  end
end
