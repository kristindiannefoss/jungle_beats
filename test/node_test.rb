require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'
require './lib/node'

class NodeTest < Minitest::Test
  def test_a_new_instance_of_Node_can_be_created
    new_node = Node.new("one", nil)
    assert_equal Node, new_node.class
  end

  def test_it_can_take_in_data
    new_node = Node.new("one", nil)
    assert_equal "one", new_node.data
  end

  def test_it_is_instantiated_with_link_set_to_nil
    new_node = Node.new("one", nil)
    assert_equal nil, new_node.next
  end
end
