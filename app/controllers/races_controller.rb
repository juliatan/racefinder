class RacesController < ApplicationController
	def index
		@race = Race.find_by(name: params[:marathon])
	end
end
