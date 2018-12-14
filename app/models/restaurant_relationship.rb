class RestaurantRelationship < ApplicationRecord
  belongs_to :parent, class_name: "Restaurant"
  belongs_to :child, class_name: "Restaurant"
  validates :parent_id, presence: true
  validates :child_id, presence: true

end
