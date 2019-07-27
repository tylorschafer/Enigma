require_relative 'test_helper'

class ShiftTest < Minitest::Test

  def setup
      @shift = Shift.new("01234", "062719")
      @sample_shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_attributes
    expected_1 =  {
        :a => 1,
        :b => 12,
        :c => 23,
        :d => 34
      }
      expected_2 = {
        :a => 2,
        :b => 9,
        :c => 6,
        :d => 1
      }
    assert_equal ({}), @shift.collected_shifts
    assert_equal expected_1, @shift.key_shifts
    assert_equal expected_2, @shift.offset_shifts
  end

  def test_merge_subshifts
    expected_1 = {
      :a => 3,
      :b => 21,
      :c => 29,
      :d => 35
    }
    assert_equal expected_1, @shift.merge_subshifts
  end
end
