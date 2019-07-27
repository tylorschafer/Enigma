require_relative 'test_helper'

class ShiftTest < Minitest::Test

  def setup
      @shift = Shift.new("01234", "062719")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_collected_shifts_starts_empty_hash
    assert_equal ({}), @shift.collected_shifts
  end

  def test_key_shifts
    expected =  {
        :a => 1,
        :b => 12,
        :c => 23,
        :d => 34
      }
    assert_equal expected, @shift.key_shifts
  end

  def test_offset_shifts
    expected = {
      :a => 2,
      :b => 9,
      :c => 6,
      :d => 1
    }
    assert_equal expected, @shift.offset_shifts
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
