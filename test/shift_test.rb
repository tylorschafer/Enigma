require_relative 'test_helper'

class ShiftTest < Minitest::Test

  def setup
      @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_collected_shifts_starts_empty_hash
    assert_equal ({}), @shift.collected_shifts
  end

  def test_random_key

  end

end
