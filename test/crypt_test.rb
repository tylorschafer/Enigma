require_relative 'test_helper'

class CryptTest < Minitest::Test

  def setup
    @crypt = Crypt.new
  end

  def test_it_exists
    assert_instance_of Crypt, @crypt
  end

  def test_get_character_set
    expected = ["a", "b", "c", "d",
                "e", "f", "g", "h",
                "i", "j", "k", "l",
                "m", "n", "o", "p",
                "q", "r", "s", "t",
                "u", "v", "w", "x",
                "y", "z", " "]
    assert_equal expected, @crypt.character_set
  end

end
