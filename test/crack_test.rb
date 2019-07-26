require_relative 'test_helper'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new
  end

  def test_it_exsists
    assert_instance_of Crack, @crack
  end
end
