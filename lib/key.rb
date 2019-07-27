class Key
  attr_reader :key_shifts, :user_key

  def initialize(user_key = random_key.to_s)
    @key_shifts = {}
    @user_key = user_key
  end

  def random_key
    rand(1..99999).to_s.rjust(5, "0")
  end

  def create_key_subshifts(key = user_key)
    @key_shifts[:a] = key[0..1].to_i
    @key_shifts[:b] = key[1..2].to_i
    @key_shifts[:c] = key[2..3].to_i
    @key_shifts[:d] = key[3..4].to_i
    @key_shifts
  end

end
