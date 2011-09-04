# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Cat < ActiveRecord::Base
end
class Prod < ActiveRecord::Base
end
=begin
Category.delete_all
Cat.establish_connection(:adapter => "sqlite3",:database => "crawler/products.db")
Cat.all.each do |c|
	Category.create!(c.attributes)
=end
Product.delete_all
Prod.establish_connection(:adapter => "sqlite3",:database => "crawler/products.db")
Prod.all.each do |p|
	Product.create!(:bar_code => p.bar_code, :name => p.desc, :image => p.local_img,
					:content => p.quantity, :content_units => p.units,
					:sale_units => p.tipo, :equivalence => p.equivalence,
					:ingredient => p.ingredient, :category_id => p.cat_id)
end
