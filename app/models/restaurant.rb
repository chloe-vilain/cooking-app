class Restaurant < ApplicationRecord
  has_many :recipes
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
end
