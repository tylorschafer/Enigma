require_relative 'test_helper'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new
  end

  def test_it_exists
    assert_instance_of Crack, @crack
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
end
