gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/elephant_line'
require '../lib/elephant'

class ElephantLineTest < Minitest::Test

  def test_a_new_jungle_beat_list_can_be_instantiated
    line_of_phants = ElephantLine.new("beep")
    assert_equal ElephantLine, line_of_phants.class
  end

  def test_it_can_take_in_a_new_elphant_to_the_end_of_the_line_of_phants_and_count_new_noises_added
    line_of_phants = ElephantLine.new("bop")
    assert_equal 1, line_of_phants.append("deep")
    assert_equal "deep", line_of_phants.find_tail_elephant.mouth_holds
  end

  def test_it_can_add_an_elephant_to_the_head_of_the_line_and_count_new_noises_added
    line_of_phants = ElephantLine.new("tee")
    assert_equal 1, line_of_phants.prepend("shmoop")
    assert_equal "shmoop", line_of_phants.head_elephant.mouth_holds
  end

  def test_it_can_find_the_last_elephant
    line_of_phants = ElephantLine.new("beep")
    seek = line_of_phants.find_tail_elephant
    assert_equal "beep", seek.mouth_holds
  end

  def it_can_display_a_list_of_noises_added
    line_of_phants = ElephantLine.new("deep dop doop")
    new_ele = Elephant.new("beep boop bam")
    line_of_phants.append(new_ele)
    assert_equal "deep dop doop beep boop bam", line_of_phants.display_all
  end

  def test_it_can_insert_one_or_more_elements_at_an_arbitrary_position_in_the_list
    line_of_phants = ElephantLine.new("deep dop doooop")
    new_ele = Elephant.new("beep boop bam")
    line_of_phants.append(new_ele)
    new_ele2 = Elephant.new("meep moop mam")
    line_of_phants.append(new_ele2)
    assert_equal "deep dop doop beep boop bam meep moop mam", line_of_phants.display_all

    new_ele3 = Elephant.new(4,"BOOM")
    assert_equal "deep dop doop BOOM beep boop bam meep moop mam", line_of_phants.insert(4, new_ele3)
  end

  def test_it_gives_back_true_or_false_whether_the_supplied_value_is_in_the_list
    line_of_phants = ElephantLine.new("deep dop doooop")
    new_ele = Elephant.new("beep boop bam")
    line_of_phants.append(new_ele)
    new_ele2 = Elephant.new("meep moop mam")
    line_of_phants.append(new_ele2)

    assert_equal true, line_of_phants.include?("moop")
  end

  def test_it_can_pop_one_or_more_elements_from_the_end_of_the_list
    skip
    line_of_phants = ElephantLine.new("deep dop doooop")
    new_ele = Elephant.new("beep boop bam")
    line_of_phants.append(new_ele)
    new_ele2 = Elephant.new("meep moop mam")
    line_of_phants.append(new_ele2)

    assert_equal "moop mam", line_of_phants.remove(2)
  end

  def test_it_can_count_the_number_of_elements_in_the_list
  end

  def test_it_can_find_one_or_more_elements_based_on_arbitrary_positions_in_the_list
  end

  def test_it_can_take_two_parameters_the_first_parameter_indicates_the_first_position_to_return_and_the_second_parameter_specifies_how_many_elements_to_return

  end

end
