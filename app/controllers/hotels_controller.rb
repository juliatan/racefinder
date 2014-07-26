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

    # @city_hotels_within_budget = @city_hotels.where("price < ?", params[:price].to_f)
    # Client.first(:conditions => ["orders_count = ?", params[:orders]])
    @city_hotels_within_budget = @city_hotels.where("price > ?", params[:price].to_f)
    
    @city_hotels_selected = @city_hotels_within_budget.where(ref_lat: @ref_lat)
  end
end
