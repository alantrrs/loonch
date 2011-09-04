# coding: utf-8
class CategoriesController < ApplicationController
def index
	@title = "Navegar"
	@category =  Category.find(1)
end
def show
	id =params[:id]
	#id ||= 1
	@category = Category.find(id)
	#@title = (id==1) ? "Navegar" : @category.name
	@title = @category.name
	@products = @category.products
end

end
