class RestaurantRelationship < ApplicationRecord
  belongs_to :parent, class_name: "Restaurant"
  belongs_to :child, class_name: "Restaurant"
  validates :parent_id, presence: true
  validates :child_id, presence: true
  validate :validate_recipe_count
  validate :validate_recipe_id
  validate :validate_contains_exactly_one_rule

  private

    def validate_recipe_count
      if !required_count.nil?
        if required_count < 1
          errors.add(:required_count, "is less than 1")
        end
        if required_count > parent.recipes.count
          errors.add(:required_count, "is greater than the number of recipes for the parent restaurant")
        end
      end
    end

    def validate_recipe_id
      if !required_recipe_id.nil?
        if !Recipe.find_by(id: required_recipe_id)
          errors.add(:required_recipe_id, "does not exist")
        end
      end
    end

    def validate_contains_exactly_one_rule
      if (required_recipe_id.nil? && required_count.nil?)
        errors.add(:base, :required_recipe_id_and_recipe_count_blank, message: "required_recipe_id or recipe_count must be present")
      elsif (!required_recipe_id.nil? && !required_count.nil?)
        errors.add(:base, :required_recipe_id_and_recipe_count_present, message: "rule cannot contain both recipe_count and required_recipe_id")
      end
    end


end
