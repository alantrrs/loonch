class CartsController < ApplicationController
	def new
		@current_cart = Cart.create!(:user_id => current_user.id, :status => "Abierto")
		for ingredient in Loonch.find_by_id(params[:loonch_id]).ingredients do
			q = params[:quantity].to_i*ingredient.quantity
			Item.create!(:cart_id => @current_cart.id,
						 :product_id => ingredient.product_id,
						 :sale_quantity => q.ceil,	
					     :lef_quantity => q.ceil - q)
		end
		init(@current_cart)
		respond_to do |format|
  			format.html { redirect_to home_path }
  			format.js
		end
	end

	def update
		for ingredient in Loonch.find_by_id(params[:loonch_id]).ingredients do
			q = params[:quantity].to_i*ingredient.quantity
			it = Item.find_or_create_by_cart_id_and_product_id(:cart_id => params[:cart_id],
					 :product_id => ingredient.product_id)
			it.sale_quantity ||= 0
			it.lef_quantity ||= 0
			it.sale_quantity += q - it.lef_quantity
			it.lef_quantity = it.sale_quantity.ceil - it.sale_quantity
			it.sale_quantity = it.sale_quantity.ceil
			it.save
		end
		respond_to do |format|
  			format.html { redirect_to home_path }
  			format.js
		end
	end
	def checkout
		@current_cart = Cart.find_by_id(params[:cart_id])
	end
	def buy_with
		@current_cart = Cart.find_by_id(params[:cart_id])
		#@current_cart.total_price = Provider.find(params[:provider]).prices
		#guardar
		@current_cart.status = "Procesando orden"
		@current_cart.save
		flash[:success]="Tu orden ha sido enviada al proveedor. Gracias por usar Loonch!"
		redirect_to home_path
	end
end
