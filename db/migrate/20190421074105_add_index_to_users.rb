class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
  end
  add_index :users, :nickname, unique: true
end
