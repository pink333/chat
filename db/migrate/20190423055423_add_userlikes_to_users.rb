class AddUserlikesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :userlike_id, :integer
    add_index :users, :userlike_id, unique: true
  end
end
