class Key
  attr_reader :key_shifts

  def initialize
    @key_shifts = Hash.new(0)
  end

end
