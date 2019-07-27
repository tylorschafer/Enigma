class Key
  attr_reader :key_shifts

  def initialize
    @key_shifts = {}
  end

  def random_key
    random_key = rand(1..99999).to_s.rjust(5, "0")
  end

  def create_key_subshifts(key = random_key)
    @key_shifts[:a] = key[0..1].to_i
    @key_shifts[:b] = key[1..2].to_i
    @key_shifts[:c] = key[2..3].to_i
    @key_shifts[:d] = key[3..4].to_i
    @key_shifts
  end

end
