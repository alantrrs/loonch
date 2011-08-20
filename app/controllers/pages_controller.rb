class PagesController < ApplicationController
before_filter :signed_in, :only => :welcome
  def home
  	@title = "Home"
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

  def signed_in
	#redirect_to(home_path) if signed_in?
  end

end
