class AddColumnToRaces < ActiveRecord::Migration
  def change
    add_column :races, :start_lat, :float
    add_column :races, :start_long, :float
    add_column :races, :finish_lat, :float
    add_column :races, :finish_long, :float
  end
end
