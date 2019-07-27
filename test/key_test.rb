require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key_empty = Key.new
    @key = Key.new("04876")
  end

  def test_it_exists
    assert_instance_of Key, @key_empty
    assert_instance_of Key, @key
  end

  def test_attributes
    assert_nil @key_empty.user_key
    assert_equal "04876", @key.user_key
  end

end
