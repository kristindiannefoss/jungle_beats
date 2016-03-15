require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beats'
require './lib/node'

class JungleBeatsTest < Minitest::Test
  def test_a_new_instance_of_JungleBeats_can_be_created
    new_list = JungleBeats.new("start")
    result = new_list.class

    assert_equal JungleBeats, result
  end

  def test_head_is_start_node_when_list_is_created
    new_list = JungleBeats.new("start")
    result = new_list.head.beats

    assert_equal "start", result
  end

  def test_it_can_find_the_end_of_the_list_called_tail
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("beep")
    result = new_list.tail.beats

    assert_equal "beep", result
  end

  def test_it_does_not_add_a_valid_beat
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("beep")
    new_list.append("nope")

    result = new_list.all
    assert_equal "start tee beep", result
  end

  def test_it_can_list_all
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.all
    assert_equal "start tee deep dee", result
  end

  def test_it_can_count_nodes_in_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.count
    assert_equal 4, result
  end

  def test_it_can_append_beats_onto_the_end_of_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("tee tee deep")

    result = new_list.all
    assert_equal "start tee tee tee deep", result
  end

  def test_it_can_append_multi_beats
    new_list = JungleBeats.new("start")
    new_list.append("tee tee deep")

    result = new_list.all
    assert_equal "start tee tee deep", result
  end

  def test_it_can_prepend_beats_onto_the_start_of_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.prepend("bop bop bop")
    assert_equal 3, result

    result2 = new_list.head.beats
    assert_equal "bop", result2
  end

  def test_it_can_insert_one_element_at_an_arbitrary_position_in_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.insert(3, "bop")
    assert_equal "start tee deep bop dee", result
  end

  def test_it_can_insert_twe_or_more_elements_at_an_arbitrary_position_in_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.insert(3, "bop bop bop")
    assert_equal "start tee deep bop bop bop dee", result
  end

  def test_it_can_search_for_a_word_with_includes?
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.include?("tee")
    assert_equal true, result
    result2 = new_list.include?("nope")
    assert_equal false, result2
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

    result = new_list.pop(1)
    assert_equal "na", result
    result2 = new_list.pop(2)
    assert_equal "bop la", result2
    result3 = new_list.pop(12)
    assert_equal "you are trying to pop more nodes than the list contains", result3
  end

  def test_it_can_find_one_or_more_elements_based_on_arbitrary_positions_in_the_list
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("bop")
    new_list.append("la")
    new_list.append("na")

    result = new_list.find(3, 2)
    assert_equal "bop la", result
    result2 = new_list.find(1, 3)
    assert_equal "deep dee bop", result2
    result3 = new_list.find(1, 5)
    assert_equal "deep dee bop la na", result3
  end

  def test_it_can_validate_and_append_beats_to_a_list
    beats = JungleBeats.new("beat")
    beats.append("bop")

    result = beats.all
    assert_equal "beat bop", result
  end

  def test_it_wont_append_beats_that_dont_pass_vailidation
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("nope")

    result = new_list.all
    assert_equal "start tee deep dee", result
  end

  def test_it_wont_prepend_beats_that_dont_pass_vailidation
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.prepend("nope")
    assert_equal 0, result
    result2 = new_list.all
    assert_equal "start tee deep dee", result2
  end

  def test_it_wont_insert_beats_that_dont_pass_vailidation
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")

    result = new_list.insert(1, "nope")
    assert_equal "start tee deep dee", result
  end

  def test_it_can_play_beats
    new_list = JungleBeats.new("start")
    new_list.append("tee")
    new_list.append("deep")
    new_list.append("dee")
    new_list.append("bop")
    new_list.append("la")
    new_list.append("na")

    result = "can I hear it or not?"
    new_list.play
  end
end
