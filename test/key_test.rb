require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
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
end
