class AddUsertxtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :userdes, :string
    add_column :users, :usertxt, :text
  end
end
