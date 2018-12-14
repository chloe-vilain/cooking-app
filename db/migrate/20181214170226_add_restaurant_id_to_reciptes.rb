class AddRestaurantIdToReciptes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :restaurant, foreign_key: true
  end
end
