require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exsists
    assert_instance_of Key, @key
  end

end