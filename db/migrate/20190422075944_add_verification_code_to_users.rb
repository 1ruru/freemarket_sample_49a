class AddVerificationCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verification_code, :string
    add_column :users, :authenticated, :boolean, default: false
  end
end
