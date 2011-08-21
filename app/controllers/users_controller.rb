# coding: utf-8
class UsersController < ApplicationController
before_filter :authenticate, :except => [:show, :new, :create]
before_filter :correct_user, :only => [:edit, :update]
before_filter :admin_user,   :only => :destroy

def show
   @user = User.find(params[:id])
   #@recipes = @user.recipes.paginate(:page => params[:page])
   @title = @user.name
end

def create
    @user = User.new(params[:user])
    if @user.save
	  sign_in @user
	  flash[:success] = "Bienvenido a Loonch!"
	  redirect_to home_path
    else
      @title = "Bienvenido"
      render 'pages/welcome'
    end
end

def edit
    @title = "Cuenta"
end

def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Perfil actualizado"
      redirect_to @user
    else
      @title = "Cuenta"
      render 'edit'
    end
  end

def destroy
	User.find(params[:id]).destroy
	flash[:success]= "Cuenta eliminada"
	redirect_to root_path
end

private

def correct_user
	@user = User.find(params[:id])
	redirect_to(root_path) unless current_user?(@user)
end
def admin_user
	redirect_to(root_path) unless current_user.admin?
end

end
