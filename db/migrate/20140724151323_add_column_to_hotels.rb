class AddColumnToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :city, :string
    add_column :hotels, :ref_lat, :float
    add_column :hotels, :ref_long, :float
  end
end
