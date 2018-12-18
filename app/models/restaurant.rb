class Restaurant < ApplicationRecord
  has_many :recipes
  #has_many :parent_relationships, class_name:  "RestaurantRelationship",
                                #foreign_key: "parent_id",
                                #dependent:   :destroy
  #has_many :children, through: :parent_relationships, source: :child
  #has_many :child_relationships, class_name:  "RestaurantRelationship",
                                #foreign_key: "child_id",
                                #dependent:   :destroy
  #has_many :parents, through: :child_relationships, source: :parent
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
end
