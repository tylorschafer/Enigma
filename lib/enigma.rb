class Enigma
  attr_reader :message, :key, :offset, :character_set, :shifts

  def initialize(message, key = Key.new.random_key, offset = Offset.new.get_date)
    @message = message
    @key = key
    @offset = offset
    @character_set = generate_character_set
    @shifts = Shift.new(key, offset).merge_subshifts
  end

  def generate_character_set
    ("a".."z").to_a << " "
  end
end
