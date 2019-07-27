class Crypt
  attr_reader :character_set

  def initialize
    @character_set = generate_character_set
  end

  def generate_character_set
    ("a".."z").to_a << " "
  end

end
