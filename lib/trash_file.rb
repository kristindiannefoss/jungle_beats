gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/elephant_line'
require '../lib/elephant'

class ElephantLineTest < Minitest::Test
  # class exists
  #   can make an instance of a class
  #   expecting the right number of arguements, can prob do this all in one test
  def test_a_new_jungle_beat_list_can_be_instantiated
    # list = JungleBeat.new("bop")
    line_of_phants = ElephantLine.new("beep")

    assert_equal ElephantLine, line_of_phants.class
    # assert_equal JungleBeat, list.class
  end

  def test_it_can_take_in_a_new_elphant_to_the_end_of_the_line_of_phants_and_count_new_noises_added
    line_of_phants = ElephantLine.new("bop")

    assert_equal 1, line_of_phants.append("deep") #count of how many things are added to the list
    assert_equal "deep", line_of_phants.find_tail_elephant.mouth_holds
  end

  def test_it_can_add_an_elephant_to_the_head_of_the_line_and_count_new_noises_added
    line_of_phants = ElephantLine.new("tee")

    assert_equal 1, line_of_phants.prepend("shmoop") #count of how many things are added to the list
    assert_equal "shmoop", line_of_phants.head_elephant.mouth_holds

  end

  def test_it_can_find_the_last_elephant
    line_of_phants = ElephantLine.new("beep")

    dumbo = line_of_phants.find_tail_elephant
    assert_equal "beep", dumbo.mouth_holds
  end

  # def test_it_has_a_head
  #   skip
  #   # list = JungleBeat.new("bop")
  #   # # assert list.head
  #   # assert_respond_to list, :head
  #   #tells me that the value is truthy, head, it exists
  #   #assert_respond_to object to call method on (list), second arguemnt is the method name, :head
  # end
  def it_can_display_a_list_of_noises_added
    line_of_phants = ElephantLine.new("deep dop doooop")
    new_ele = Elephant.new("beep boop bam")
    assert_equal "deep dop doooop beep boop bam", line_of_phants.display_all

  end

  def test_it_can_insert_one_or_more_elements_at_an_arbitrary_position_in_the_list
    skip
    line_of_phants = ElephantLine.new("deep dop doooop")

    assert_equal ["deep" "dop" "doooop"], line_of_phants.display_all
    new_ele = Elephant.new("beep boop bam")


    assert_equal "deep dop doooop beep boop bam", line_of_phants.display_all
    #it keeps count of the elephants after it's self
    #it takes two parameters, position to put the elephant and then what to put
  end

  # includes?
  def test_it_gives_back_true_or_false_whether_the_supplied_value_is_in_the_list
  end

  def test_it_can_pop_one_or_more_elements_from_the_end_of_the_list
  end

  def test_it_can_count_the_number_of_elements_in_the_list
  end

  def test_it_can_find_one_or_more_elements_based_on_arbitrary_positions_in_the_list
  end

  def test_it_can_take_two_parameters_the_first_parameter_indicates_the_first_position_to_return_and_the_second_parameter_specifies_how_many_elements_to_return
  #
  # return_all elements in the linked list in order

  end

end

    # assert_equal ["deep" "dop" "doooop"], line_of_phants.display_all
    # new_ele = Elephant.new("beep boop bam")
    #
    #
    # assert_equal "deep dop doooop beep boop bam", line_of_phants.display_all
