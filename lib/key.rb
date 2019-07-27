require 'pry'
class Key
  attr_reader :key_shifts

  def initialize
    @key_shifts = {}
  end

  def random_key
    random_key = rand(1..99999).to_s.rjust(5, "0")
  end

  def create_key_subshifts(key)
    @key_shifts[:a] = key[0..1]
    @key_shifts[:b] = key[1..2]
    @key_shifts[:c] = key[2..3]
    @key_shifts[:d] = key[3..4]
    @key_shifts
  end

end
