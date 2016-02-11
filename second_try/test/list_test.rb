gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/list'
require '../lib/node'

class ListTest < Minitest::Test

  def test_a_new_instance_of_list_can_be_created
    list1 = List.new("beep")

    assert_equal List, list1.class
  end

  def test_it_can_find_the_tail_of_the_list
    list1 = List.new("beep")

    assert_equal "beep", list1.find_tail
  end

  def test_a_node_can_be_added_to_the_end_of_the_list

  end


end
