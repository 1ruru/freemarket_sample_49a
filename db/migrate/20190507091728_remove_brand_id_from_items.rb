class RemoveBrandIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :user_id_id, :references
    remove_column :items, :brand_id, :integer
  end
end
