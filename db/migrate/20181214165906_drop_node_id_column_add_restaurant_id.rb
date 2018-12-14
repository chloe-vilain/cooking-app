class DropNodeIdColumnAddRestaurantId < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :node_id
  end
end
