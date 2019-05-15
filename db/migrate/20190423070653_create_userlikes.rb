class CreateUserlikes < ActiveRecord::Migration[5.2]
  def change
    create_table :userlikes do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :userlikes, [:user_id, :created_at]
  end
end
