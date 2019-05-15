class AddSoldOutToitems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sold_out, :boolean, default: false
  end
end
