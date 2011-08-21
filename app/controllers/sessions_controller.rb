# coding: utf-8

class SessionsController < ApplicationController

def create
  	user = User.authenticate(params[:session][:email],
                    params[:session][:password])
    if user.nil?
      flash[:error] = "Combinación incorrecta de correo/contraseña"
      redirect_to root_path
    else
    	sign_in(user)
      	redirect_to home_path
	end
end

def destroy
	sign_out
    flash[:success] = "Has salido correctamente de Loonch!. Gracias por tu visita!"
	redirect_to root_path
end

end
