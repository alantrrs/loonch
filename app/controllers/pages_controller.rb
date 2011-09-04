# coding: utf-8
class PagesController < ApplicationController
before_filter :wsigned_in, :only => :welcome
  def home
  	@title = "Home"
	@popular_items = Loonch.where("name = ?", params[:q] )
 	@popular_items ||= Loonch.last(10)
	@products = Product.where("name = ?", params[:q])
	@products ||= Product.last(10)
 	@cart = params[:cart]
	@cart ||= Cart.new
 end
  def welcome
	@title = "Bienvenido"
  	@user = User.new
  end

  def contact
  	@title = "Contacto"
  end

  def about
  	@title = "Sobre nosotros"
  end

  def blog
  	@title = "Blog"
  end
  
private

  def wsigned_in
	redirect_to(home_path) if signed_in?
  end

end
