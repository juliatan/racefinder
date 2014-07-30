class AddTripAdvisorGifToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :tripadvisor_gif, :text
  end
end
