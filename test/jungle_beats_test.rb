require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/list'
require './lib/jungle_beats'

class JungleBeatsTest < Minitest::Test
  def test_a_new_instance_of_jungle_beats_can_be_created
    beats = JungleBeats.new("beat")

    assert_kind_of JungleBeats, beats
  end

  def test_it_can_append_beats_to_a_list
    beats = JungleBeats.new("beat")
    beats.append("deep")
    assert_equal "beat deep", beats.all
  end

  def test_it_can_validate_and_append_beats_to_a_list
    beats = JungleBeats.new("beat")
    beats.append("new")
    assert_equal "beat", beats.all

  end
end

#
# beats.append("deep")
# assert_equal "beat deep", beats.all
