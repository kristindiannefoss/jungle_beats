gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/list'
require '../lib/node'

class NodeTest < Minitest::Test

def test_a_new_instance_of_node_can_be_created
  node1 = Node.new("beep")

  assert_equal Node, node1.class
end

end
