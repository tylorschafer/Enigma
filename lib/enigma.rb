require './modules/enigma_helpers'
class Enigma
  include EnigmaHelpers
  attr_reader :character_set

  def initialize
    @key = Key.new.random_key
    @offset = Offset.new.get_date
    @character_set = generate_character_set
  end

  def encrypt_hash(key, date)
    {:encryption => "",
      :key => key,
      :date => date}
  end

  def decrypt_hash(key, date)
    {:decryption => "",
      :key => key,
      :date => date}
  end

  def encrypt(message, key = @key, date = @offset)
    rotate_message(message, key, date)
  end

  def decrypt(message, key = @key, date = @offset)
    rotate_message(-1, message, key, date)
  end
end
