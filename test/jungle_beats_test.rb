require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beats'
require './lib/node'

class JungleBeatsTest < Minitest::Test
  def test_a_new_instance_of_JungleBeats_can_be_created
    new_list = JungleBeats.new("start")
    assert_equal JungleBeats, new_list.class
  end

  def test_head_is_start_node_when_list_is_created
    new_list = JungleBeats.new("start")
    assert_equal "start", new_list.head.data
  end

  def test_it_can_find_the_end_of_the_list_called_tail
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("beep")
    assert_equal "beep", new_list.find_tail.data
  end

  def test_it_can_list_all
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    assert_equal "start tee deep dee", new_list.all
  end

  def test_it_can_count_nodes_in_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    assert_equal 4, new_list.count
  end

  def test_it_can_append_data_onto_the_end_of_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    assert_equal "start tee", new_list.all
  end

  def test_it_can_split_beats_into_an_array
    new_list = JungleBeats.new("start")
    assert_equal ["tee", "deep", "dee"], new_list.split_beats("tee deep dee")
  end

  def test_it_can_prepend_data_onto_the_start_of_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    assert_equal 1, new_list.prepend("bop")
    assert_equal "bop", new_list.head.data
  end

  def test_it_can_insert_tee_or_more_elements_at_an_arbitrary_position_in_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    assert_equal "start tee deep bop dee", new_list.insert(3, "bop")
  end

  def test_it_can_search_for_a_word_with_includes?
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    assert_equal true, new_list.include?("tee")
    assert_equal false, new_list.include?("nope")
  end

  def test_it_can_pop_off_a_number_of_elements_from_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("bop")
    new_list.append("la")
    new_list.append("na")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("bop")
    new_list.append("la")
    new_list.append("na")
    assert_equal "na", new_list.pop(1)
    assert_equal "bop la", new_list.pop(2)
    assert_equal "you are trying to pop more nodes than the list contains", new_list.pop(12)
  end

  def test_it_can_find_one_or_more_elements_based_on_arbitrary_positions_in_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("bop")
    new_list.append("la")
    new_list.append("na")

    assert_equal "bop la", new_list.find(3, 2)
    assert_equal "deep dee bop", new_list.find(1, 3)
    assert_equal "deep dee bop la na", new_list.find(1, 5)
  end

  def test_it_can_validate_and_append_beats_to_a_list
    beats = JungleBeats.new("beat")
    beats.append("bop")
    assert_equal "beat bop", beats.all
  end

  def test_it_wont_append_beats_that_dont_pass_vailidation
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("nope")
    assert_equal "start tee deep dee", new_list.all
  end

  def test_it_wont_prepend_beats_that_dont_pass_vailidation
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.prepend("nope")
    assert_equal "start tee deep dee", new_list.all
  end

  def test_it_wont_insert_beats_that_dont_pass_vailidation
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    assert_equal "start tee deep dee", new_list.insert(1, "nope")
  end

  def test_it_can_play_beats
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("bop")
    new_list.append("la")
    new_list.append("na")

    new_list.play
  end
end
