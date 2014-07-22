class RacesController < ApplicationController
	def index
		@selection = params[:race]

		@test = "test"
	end
end
