class AddGymToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :gym, :boolean
  end
end
