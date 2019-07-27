require_relative 'test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_offset_shifts_starts_empty_hash
    assert_equal ({}), @offset.offset_shifts
  end

end
