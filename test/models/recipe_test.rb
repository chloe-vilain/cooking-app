require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @restaurant = restaurants(:seafood)
    @recipe = @restaurant.recipes.build(name: "My Recipe")
  end

  test "should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = nil
    assert_not @recipe.valid?
  end

  test "name should not exceed 255 chars" do
    @recipe.name = 'a'*256
    assert_not @recipe.valid?
  end

  test "node should be present" do
    @recipe.restaurant_id = nil
    assert_not @recipe.valid?
  end

end
