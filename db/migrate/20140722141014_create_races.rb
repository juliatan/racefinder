class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.text :name
      t.text :address

      t.timestamps
    end
  end
end
