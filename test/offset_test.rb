require_relative 'test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
    @stubbed_offset = mock
    @stubbed_offset.stubs(:get_date).returns("062619")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_offset_shifts_starts_empty_hash
    assert_equal ({}), @offset.offset_shifts
  end

  def test_get_date
    assert_instance_of String, @offset.get_date
    assert_equal 6, @offset.get_date.size
  end

  def test_square_date
    assert_equal 8317257601 , @offset.square_date("091199")
    assert_equal 3921139161, @offset.square_date(@stubbed_offset.get_date)
  end

end
