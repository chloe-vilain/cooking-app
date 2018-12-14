require 'test_helper'

class RestaurantRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @seafood = restaurants(:seafood)
    @continental = restaurants(:steak)
    @scallops = recipes(:scallops)
    @salmon = recipes(:salmon)
    @surfturf = recipes(:surfturf)
    @rule_number = RestaurantRelationship.new(parent_id: @seafood.id, child_id: @continental.id, required_count: 1)
    @rule_recipe = RestaurantRelationship.new(parent_id: @seafood.id, child_id: @continental.id, required_recipe_id: @scallops.id)
  end

  test "rule number should be valid" do
    assert @rule_number.valid?
  end

  test "rule number cannot be <1" do
    @rule_number.required_count = -1
    assert_not @rule_number.valid?
  end

  test "rule number cannot be greater than parent recipes count" do
    @rule_number.required_count = 3
    assert_not @rule_number.valid?
  end

  test "rule recipe should be valid" do
    assert @rule_recipe.valid?
  end

  test "rule recipe must reference a real recipe" do
    @rule_recipe.required_recipe_id = 1000
    assert_not @rule_recipe.valid?
  end

  test "rule must contain one of required_recipe_id or required_count" do
    @rule_recipe.required_recipe_id = nil
    assert_not @rule_recipe.valid?
  end

  test "rule must not contain both of required_recipe_id or required_count" do
    @rule_number.required_recipe_id = @salmon.id
    assert_not @rule_number.valid?
  end

end
