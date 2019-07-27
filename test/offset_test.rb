require_relative 'test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new("062719")
    @stubbed_offset = mock
    @stubbed_offset.stubs(:get_date).returns("062619")
    @stubbed_offset.stubs(:square_date_offset).returns("9161")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_attributes
    assert_equal ({}), @offset.offset_shifts
    assert_equal "062719", @offset.user_date
  end

  def test_get_date
    assert_instance_of String, @offset.get_date
    assert_equal 6, @offset.get_date.size
  end

  def test_square_date_offset
    assert_equal "2961" , @offset.square_date_offset
    assert_equal "9161", @offset.square_date_offset(@stubbed_offset.get_date)
  end

  def test_create_offset_subshifts
    expected_1 = {
      :a => 2,
      :b => 9,
      :c => 6,
      :d => 1
    }
    expected_2 = {
      :a => 9,
      :b => 1,
      :c => 6,
      :d => 1
    }
    assert_equal expected_1, @offset.create_offset_subshifts
    assert_equal expected_2, @offset.create_offset_subshifts(@stubbed_offset.square_date_offset)
  end
end
