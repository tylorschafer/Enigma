require 'pry'
class Key
  attr_reader :key_shifts

  def initialize
    @key_shifts = Hash.new(0)
  end

  def random_key
    random_key = rand(1..99999).to_s.rjust(5, "0")
  end

end
