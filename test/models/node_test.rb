require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @node = Node.new(name: "My Restaurant", description: "Serves seafood")
  end

  test "should be valid" do
    assert @node.valid?
  end

  test "name should be present" do
    @node.name = nil
    assert_not @node.valid?
  end

  test "name should not exceed 255 characters" do
    @node.name = 'a'*256
    assert_not @node.valid?
  end

  test "description should be present" do
    @node.description = nil
    assert_not @node.valid?
  end

end
