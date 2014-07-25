class AddRaceIdToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :race, index: true
  end
end
