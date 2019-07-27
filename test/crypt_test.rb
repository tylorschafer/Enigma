require_relative 'test_helper'

class CryptTest < Minitest::Test

  def setup
    @crypt = Crypt.new("01234", "062719")
  end

  def test_it_exists
    assert_instance_of Crypt, @crypt
  end

  def test_attributes
    expected_1 = {
      :a => 3,
      :b => 21,
      :c => 29,
      :d => 35
    }
    expected_2 = ["a", "b", "c", "d",
                "e", "f", "g", "h",
                "i", "j", "k", "l",
                "m", "n", "o", "p",
                "q", "r", "s", "t",
                "u", "v", "w", "x",
                "y", "z", " "]
    assert_equal expected_1, @crypt.shifts
    assert_equal expected_2, @crypt.character_set
  end
end
