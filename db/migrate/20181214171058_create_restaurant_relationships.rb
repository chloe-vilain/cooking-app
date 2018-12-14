class CreateRestaurantRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_relationships do |t|
      t.references :parent, foreign_key: true
      t.references :child, foreign_key: true
      t.references :required_recipe, foreign_key: true
      t.integer :required_count

      t.timestamps
    end
  end
end
