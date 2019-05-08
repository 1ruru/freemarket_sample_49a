class RemoveSaizuFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :saizu, :string
  end
end
