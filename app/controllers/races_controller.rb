class RacesController < ApplicationController
	def index
		@race = Race.find_by(name: params[:marathon])
		# @race = Race.find_by(name: "Sydney")
	end
end
