class Enigma
  attr_reader :character_set

  def initialize
    @key = Key.new.random_key
    @offset = Offset.new.get_date
    @character_set = generate_character_set
  end

  def generate_character_set
    ("a".."z").to_a << " "
  end

  def get_shifts(key, offset)
    Shift.new(key, offset).merge_subshifts
  end

  def encrypt(message = @message, key = @key, date = @offset)

  end
end
