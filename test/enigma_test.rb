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

  def test_rotated_set
    expected =
      ["d", "e", "f", "g",
       "h", "i", "j", "k",
       "l", "m", "n", "o",
       "p", "q", "r", "s",
       "t", "u", "v", "w",
       "x", "y", "z", " ",
       "a", "b", "c"]

    expected_2 =
      ["y", "z", " ", "a",
       "b", "c", "d", "e",
       "f", "g", "h", "i",
       "j", "k", "l", "m",
       "n", "o", "p", "q",
       "r", "s", "t", "u",
       "v", "w", "x"]

    assert_equal expected, @enigma.rotated_set("01234", "062719", 0)
    assert_equal expected_2, @enigma.rotated_set(-1, "01234", "062719", 0)
  end

  def test_encrypt_hash
    expected = {
      :encryption => "",
      :key => "02715",
      :date => "040895"
    }
    assert_equal expected, @enigma.encrypt_hash("02715", "040895")
  end

  def test_decrypt_hash
    expected = {
      :decryption => "",
      :key => "02715",
      :date => "040895"
    }
    assert_equal expected, @enigma.decrypt_hash("02715", "040895")
  end

  def test_rotate_message
    expected_1 = {
      :encryption=>"scyzutenmtfqf",
      :key=>"01324",
      :date=>"010101"
    }
    expected_2 = {
      :encryption=>"!ab#vkgcbzzc$kfc!",
      :key=>"53624",
      :date=>"290619"
    }
    expected_3 = {
      :decryption => "!ro#tate ple$ase!",
      :key => "53624",
      :date => "290619"
    }
    expected_4 = {
      :decryption=>"rotate please",
      :key=>"01324",
      :date=>"010101"
    }
    assert_equal expected_1, @enigma.rotate_message("rotate please", "01324", "010101")
    assert_equal expected_2, @enigma.rotate_message("!ro#tate ple$ase!", "53624", "290619")
    assert_equal expected_3, @enigma.rotate_message(-1, "!ab#vkgcbzzc$kfc!", "53624", "290619")
    assert_equal expected_4, @enigma.rotate_message(-1, "scyzutenmtfqf", "01324", "010101")
  end

  def test_encrypt
    expected = {
      :encryption=>"keder ohulw",
      :key=> "02715",
      :date=> "040895"
    }
    expected_2 = {
      :encryption=>"keder ohulw!",
      :key=> "02715",
      :date=> "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected_2, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_decrypt
    expected = {
      :decryption=>"hello world",
      :key=> "02715",
      :date=> "040895"
    }
    expected_2 = {
      :decryption=>"hello world!",
      :key=> "02715",
      :date=> "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_equal expected_2, @enigma.decrypt("keder ohulw!", "02715", "040895")
  end
end
