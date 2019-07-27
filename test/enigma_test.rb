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

  def test_find_index
    assert_equal 0, @enigma.find_index("a")
    assert_equal 26, @enigma.find_index(" ")
  end

  def test_find_char
    assert_equal "a", @enigma.find_char(0)
    assert_equal " ", @enigma.find_char(26)
  end

  def test_rotated_set
    expected =
      ["d", "e", "f", "g",
       "h", "i", "j", "k",
       "l", "m", "n", "o",
       "p", "q", "r", "s",
       "t", "u", "v", "w",
       "x", "y", "z", " ",
       "a", "b", "c"]

    assert_equal expected, @enigma.rotated_set("01234", "062719", 0)
  end

  def test_encrypt
    skip
    expected = {

    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

end
