class RacesController < ApplicationController
	def index
		@selection = params[:race]
	end
end
