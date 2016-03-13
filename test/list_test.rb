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

  def test_it_can_count_nodes_in_list
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")
    assert_equal 4, new_list.count
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
    assert_equal 1, new_list.prepend("four")
    assert_equal "four", new_list.head.data
  end

  def test_it_can_insert_one_or_more_elements_at_an_arbitrary_position_in_the_list
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")

    assert_equal "start one two four three", new_list.insert(3, "four")
  end

  def test_it_can_search_for_a_word_with_includes?
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")

    assert_equal true, new_list.include?("one")
    assert_equal false, new_list.include?("nope")
  end

  def test_it_can_pop_off_a_number_of_elements_from_the_list
    # skip
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")
    new_list.append("four")
    new_list.append("five")
    new_list.append("six")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")
    new_list.append("four")
    new_list.append("five")
    new_list.append("six")
    assert_equal "six", new_list.pop(1)
    assert_equal "four five", new_list.pop(2)
    assert_equal "you are trying to pop more nodes than the list contains", new_list.pop(12)
  end

  def test_it_can_find_one_or_more_elements_based_on_arbitrary_positions_in_the_list
    new_list = List.new("start")
    new_list.append("one")
    new_list.append("two")
    new_list.append("three")
    new_list.append("four")
    new_list.append("five")
    new_list.append("six")

    assert_equal "four five", new_list.find(3, 2)
    assert_equal "two three four", new_list.find(1, 3)
    assert_equal "two three four five six", new_list.find(1, 5)
  end

  def test_it_can_validate_and_append_beats_to_a_list
    beats = List.new("beat")
    beats.append("new")
    assert_equal "beat new", beats.all

  end
end
