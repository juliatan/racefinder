class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :hotel_id
      t.text :address
      t.float :lat
      t.float :long
      t.float :price
      t.float :rating
      t.float :tripadvisor_rating

      t.timestamps
    end
  end
end
