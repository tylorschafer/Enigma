class Crypt
  attr_reader :character_set, :shifts

  def initialize(key = Key.new.random_key, offset = Offset.new.get_date)
    @character_set = generate_character_set
    @shifts = Shift.new(key, offset).merge_subshifts
  end

  def generate_character_set
    ("a".."z").to_a << " "
  end

end
