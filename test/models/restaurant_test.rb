require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @restaurant = Restaurant.new(name: "My Restaurant", description: "Serves seafood")
  end

  test "should be valid" do
    assert @restaurant.valid?
  end

  test "name should be present" do
    @restaurant.name = nil
    assert_not @restaurant.valid?
  end

  test "name should not exceed 255 characters" do
    @restaurant.name = 'a'*256
    assert_not @restaurant.valid?
  end

  test "description should be present" do
    @restaurant.description = nil
    assert_not @restaurant.valid?
  end

end
