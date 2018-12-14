require 'test_helper'

class RestaurantRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @seafood = restaurants(:seafood)
    @continental = restaurants(:steak)
    @clams = @seafood.recipes.build(name: "Fried clams")
    @salmon = @continental.recipes.build(name: "Grilled salmon")
    @rule_number = RestaurantRelationship.new(parent_id: @seafood.id, child_id: @continental.id, required_count: 2)
  end

  test "rule number should be valid" do
    assert @rule_number.valid?
  end

  #test "rule number should"

end
