class LoonchesController < ApplicationController

def show
	@loonch = Loonch.find(params[:id])
end

def new
	@loonch = Loonch.new
end


end
