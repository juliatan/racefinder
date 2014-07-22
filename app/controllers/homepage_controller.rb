class HomepageController < ApplicationController
	def index
		@races = Race.all
	end
end
