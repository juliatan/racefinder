class AddPhoneNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :text
  end
end
