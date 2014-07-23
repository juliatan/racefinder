class RacesController < ApplicationController
	def index
		@selection = params[:preferred_location]

		@test = "test"
	end
end
