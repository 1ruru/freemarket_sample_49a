class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :house, :string
    add_column :users, :building, :string
  end
end
