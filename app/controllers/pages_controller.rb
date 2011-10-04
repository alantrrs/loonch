# coding: utf-8
class PagesController < ApplicationController
before_filter :wsigned_in, :only => :welcome
  def home
 	@popular_items ||= Loonch.last(10)
	#@loonch = Loonch.find_by_id(params[:loonch])
	#cart = current_user.carts.last
	#@current_cart = cart.status == "Abierto" ? cart : nil
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
	#@posts = Post.all.paginate(10)
  end
private

  def wsigned_in
	redirect_to(home_path) if signed_in?
  end

end
