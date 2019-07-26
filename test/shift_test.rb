require_relative 'test_helper'

class ShiftTest < Minitest::Test

  def setup
      @shift = Shift.new
  end

  def test_it_exsists
    assert_instance_of Shift, @shift
  end

end
