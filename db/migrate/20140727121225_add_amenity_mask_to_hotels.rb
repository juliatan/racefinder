class AddAmenityMaskToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :amenity_mask, :text
  end
end
