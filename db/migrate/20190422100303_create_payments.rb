class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :number, null: false
      t.string :cvc, null: false
      t.date :expiration_date, null: false
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :payments, :number, unique: true
  end
end
