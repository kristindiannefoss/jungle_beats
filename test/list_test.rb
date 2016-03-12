require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'
require './lib/node'

class ListTest < Minitest::Test
  def test_a_new_instance_of_List_can_be_created
    new_list = List.new("start")
    assert_equal List, new_list.class
  end

  def test_head_is_start_node_when_list_is_created
    new_list = List.new("start")
    assert_equal "start", new_list.head.data
  end

  def test_it_can_find_the_end_of_the_list_called_tail
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    assert_equal "two", new_list.tail.data
  end

  def test_it_can_list_all
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")
    assert_equal "start one two three", new_list.all
  end

  def test_it_can_append_data_onto_the_end_of_the_list
    new_list = List.new("start")
    new_list.append("one")
    assert_equal "start one", new_list.all
  end

  def test_it_can_split_beats_into_an_array
    new_list = List.new("start")
    assert_equal ["one", "two", "three"], new_list.split_beats("one two three")
  end

  def test_it_can_prepend_data_onto_the_start_of_the_list
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")
    new_list.prepend("four")
    assert_equal "four", new_list.head.data
  end

  def test_it_can_insert_one_or_more_elements_at_an_arbitrary_position_in_the_list
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")

    new_list.insert(3, "four")
    assert_equal "start one two four three", new_list.all
  end

  def test_it_can_search_for_a_word_with_includes?
    # skip
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")

    assert_equal true, new_list.include?("one")
    assert_equal false, new_list.include?("nope")
  end
end

# includes? gives back true or false whether the supplied value is in the list
# pop one or more elements from the end of the list
# count the number of elements in the list
# find one or more elements based on arbitrary positions in the list. The first parameter indicates the first position to return and the second parameter specifies how many elements to return.
# all return all elements in the linked list in order
