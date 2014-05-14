class ScreenCastsController < ApplicationController

	def index
		render json: ScreenCast.all
	end

	def show
		render json: ScreenCast.find(params[:id])
	end
end
