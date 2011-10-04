class LoonchesController < ApplicationController

def show
	@loonch = Loonch.find(params[:id])
	respond_to do |format|
      format.html { redirect_to home_path}
      format.js
    end	
end

def new
	@loonch = Loonch.new
end


end
