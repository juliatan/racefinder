class AddWifiToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :wifi, :boolean
  end
end
