require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_attributes
    expected =
     ["a", "b", "c", "d",
      "e", "f", "g", "h",
      "i", "j", "k", "l",
      "m", "n", "o", "p",
      "q", "r", "s", "t",
      "u", "v", "w", "x",
      "y", "z", " "]
    assert_equal expected, @enigma.character_set
  end

  def test_get_shifts
    expected = {
      :a => 3,
      :b => 21,
      :c => 29,
      :d => 35
    }
    assert_equal expected, @enigma.get_shifts("01234", "062719")
  end

end
