gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/elephant_line'
require '../lib/elephant'

class ElephantLineTest < Minitest::Test

#CLASS WORKS
def test_a_new_jungle_beat_list_can_be_instantiated
  line_of_phants = ElephantLine.new("one")
  assert_equal ElephantLine, line_of_phants.class
end

#APPEND TEST
  def test_it_can_take_in_a_new_elphant_to_the_end_of_the_line
    # skip
    line_of_phants = ElephantLine.new("one")
    line_of_phants.append("two")
    assert_equal "one two", line_of_phants.show_all_elephants
  end

#PREPEND TEST
def test_it_can_add_an_elephant_to_the_head_of_the_line_and_count_new_noises_added
  # skip
  line_of_phants = ElephantLine.new("tee")
  assert_equal 1, line_of_phants.prepend("shmoop")
  assert_equal "shmoop", line_of_phants.head_elephant.mouth_holds
  assert_equal "tee", line_of_phants.head_elephant.whos_your_linked_elephant.mouth_holds
end

#FIND TAIL TEST
def test_it_can_find_the_last_elephant
  # skip
  line_of_phants = ElephantLine.new("one")
  line_of_phants.append("two")

  assert_equal "two", line_of_phants.find_tail_elephant
end

#ALL TEST
def it_can_display_a_list_of_noises_added
   skip
  line_of_phants = ElephantLine.new("uno")
  line_of_phants.append("dos")
  line_of_phants.append("tres")

  assert_equal "uno dos tres", line_of_phants.show_all_elephants
end

#INCLUDES? TEST
  def test_it_gives_back_true_or_false_whether_the_supplied_value_is_in_the_list
    # skip
    line_of_phants = ElephantLine.new("one")
    line_of_phants.append("two")
    line_of_phants.append("three")

    assert_equal true, line_of_phants.include?("three")
  end

#POP
  def test_it_can_pop_one_or_more_elements_from_the_end_of_the_list
    # skip
    line_of_phants = ElephantLine.new("uno")
    line_of_phants.append("dos")
    line_of_phants.append("tres")

    # assert_equal "uno dos tres", line_of_phants.show_all_elephants
    assert_equal "dos tres", line_of_phants.remove(2)
    refute  "tres" == line_of_phants.find_tail_elephant.mouth_holds
  end

#INSERT
  def test_it_can_insert_one_or_more_elements_at_an_arbitrary_position_in_the_list
    list = ElephantLine.new("one two four")

    assert_equal "one two three four", list.let_me_in_right_there(2, "three")
  end

  def test_it_can_count_the_number_of_elements_in_the_list
    skip
    line_of_phants = ElephantLine.new("uno")
    line_of_phants.append("dos")
    line_of_phants.append("tres quatro cinco ses")

    # assert_equal "uno dos tres", line_of_phants.show_all_elephants
    assert_equal "two three", line_of_phants.count
  end

  def test_it_can_find_one_or_more_elements_based_on_arbitrary_positions_in_the_list
  end

  def test_it_can_take_two_parameters_the_first_parameter_indicates_the_first_position_to_return_and_the_second_parameter_specifies_how_many_elements_to_return

  end

end
