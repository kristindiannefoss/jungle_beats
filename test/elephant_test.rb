gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/elephant_line'
require '../lib/elephant'

class ElephantTest < Minitest::Test

  def test_a_new_instance_of_Elephant_can_be_created
      elephant = Elephant.new("bop")

      assert_equal Elephant, elephant.class
    end

  def test_it_can_take_a_value_in_its_mouth_to_make_a_sound
      watering_hole_line = Elephant.new("bop")

      assert_equal "bop", watering_hole_line.mouth_holds
  end

  def test_its_trunk_is_initially_not_holding_on_to_another_elephant
    watering_hole_line = Elephant.new("bop")
#creates a new list/line, adds one instance of an elephant, now, asking that elephant who it's trunk is holding will return nil
    assert_equal nil, watering_hole_line.whos_your_linked_elephant
  end
  #
  # def test_its_trunk_can_holding_on_to_the_next_elephant_in_line
  # end
end
