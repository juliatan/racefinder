require 'json'
require 'open-uri'

class HotelsController < ApplicationController
  def index
    @race = Race.find_by(name: params[:marathon])
    @race_id = @race.id

    if params[:preferred_location] == 'Start line'
        @ref_lat = @race.start_lat
    else
        @ref_lat = @race.finish_lat
    end

    @city_hotels = Hotel.where(race_id: @race_id)
    
    @city_hotels_selected = @city_hotels.where(ref_lat: @ref_lat)
  end
end
