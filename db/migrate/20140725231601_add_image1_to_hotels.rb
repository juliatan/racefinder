class AddImage1ToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :image1, :string
    add_column :hotels, :image2, :string
    add_column :hotels, :image3, :string
    add_column :hotels, :image4, :string
  end
end
