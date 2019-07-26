require_relative 'test_helper'

class CryptTest < Minitest::Test

  def setup
    @crypt = Crypt.new
  end

  def test_it_exsists
    assert_instance_of Crypt, @crypt
  end

end
