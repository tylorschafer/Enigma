require_relative 'test_helper'

class CrackerTest < Minitest::Test

  def setup
    @crack = Cracker.new("291018")
    @current_crack = Cracker.new("072919")
  end

  def test_it_exists
    assert_instance_of Cracker, @crack
  end

  def test_base_shifts
    expected = {
      "-4"=>19,
      "-3"=>-14,
      "-2"=>-5,
      "-1"=>-5}
    assert_equal expected, @crack.base_shifts("vjqtbeaweqihssi")
  end

  def test_reformat_base_shifts
    expected = {
      "-4"=>8,
      "-3"=>14,
      "-2"=>5,
      "-1"=>5}
    assert_equal expected, @crack.reformat_base_shifts("vjqtbeaweqihssi")
  end

  def test_assign_shifts
    expected = {
      :a=>14,
      :b=>5,
      :c=>5,
      :d=>8
    }
    assert_equal expected, @crack.assign_shifts("vjqtbeaweqihssi")
  end

  def test_crack_key
    assert_equal '08304', @crack.crack_key("vjqtbeaweqihssi")
    assert_equal '19899', @current_crack.crack_key("d gksoeqswndgiuxjvbfxvsfw")
    assert_equal '19346', @current_crack.crack_key("sv x")
    assert_equal '38831', @current_crack.crack_key("bshjyp")
  end
end
