class Recipe < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true, length: { maximum: 255 }
  validates :restaurant_id, presence: true


end
