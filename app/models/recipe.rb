class Recipe < ApplicationRecord
  belongs_to :node
  validates :name, presence: true, length: { maximum: 255 }
  validates :node_id, presence: true


end
