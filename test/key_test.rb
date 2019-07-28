require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("01234")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_attributes
    assert_equal ({}), @key.key_shifts
    assert_equal "01234", @key.user_key
  end

  def test_random_key
    assert_instance_of String, @key.random_key
    assert_equal 5, @key.random_key.size
  end

  def test_create_key_subshifts
    expected_1 = {
      :a => 1,
      :b => 12,
      :c => 23,
      :d => 34
    }
    assert_equal expected_1, @key.create_key_subshifts
  end
end
