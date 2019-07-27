require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("Hello There!", "01234", "062719")
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    expected_merged_hash = {
      :a => 3,
      :b => 21,
      :c => 29,
      :d => 35
    }
    expected_character_set =
     ["a", "b", "c", "d",
      "e", "f", "g", "h",
      "i", "j", "k", "l",
      "m", "n", "o", "p",
      "q", "r", "s", "t",
      "u", "v", "w", "x",
      "y", "z", " "]

    assert_equal "Hello There!", @enigma.message
    assert_equal "01234", @enigma.key
    assert_equal "062719", @enigma.offset
    assert_equal expected_merged_hash, @enigma.shifts
    assert_equal expected_character_set, @enigma.character_set
  end

end
