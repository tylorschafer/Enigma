require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
    @stubbed_key = mock
    @stubbed_key.stubs(:random_key).returns("56723")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_key_shifts_starts_empty_hash
    assert_equal ({}), @key.key_shifts
  end

  def test_random_key
    assert_instance_of String, @key.random_key
    assert_equal 5, @key.random_key.size
  end

  def create_subshifts
    expected_1 = {
      :a => "01",
      :b => "12",
      :c => "23",
      :d => "34"
    }
    expected_2 = {
      :a => "56",
      :b => "67",
      :c => "72",
      :d => "23"
    }
    assert_equal expected_1, @key.create_subshifts("01234")
    assert_equal expected_2, @key.create_subshifts(@stubbed_key.random_key)
  end
end
