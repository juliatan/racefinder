class AddBreakfastToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :breakfast, :boolean
  end
end
