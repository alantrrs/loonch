class Ingredient < ActiveRecord::Base
	belongs_to :loonch
	belongs_to :products
end
