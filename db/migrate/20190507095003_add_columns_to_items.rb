class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :duration, :string
    add_column :items, :shipping_agency, :string
  end
end
