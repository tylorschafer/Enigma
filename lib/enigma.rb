require './modules/rotate'
class Enigma
  include Rotate
  attr_reader :character_set

  def initialize
    @key = Key.new.random_key
    @offset = Offset.new.get_date
    @character_set = generate_character_set
  end

  def encrypt(message, key = @key, date = @offset)
    rotate_message(:encryption, message, key, date)
  end

  def decrypt(message, key = @key, date = @offset)
    rotate_message(-1, :decryption, message, key, date)
  end

  def crack(message, date = @offset)
    cracker = Cracker.new(date)
    rotate_message(-1, :decryption, message, cracker.crack_key(message), date)
  end
end
