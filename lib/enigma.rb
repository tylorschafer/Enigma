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
    encrypted_output = encrypt_hash(key, date)
    message.downcase.chomp.chars.each_with_index do |char, index|
      if @character_set.include?(char)
        new_char = rotated_set(key, date, index)[find_index(char)]
        encrypted_output[:encryption] << new_char
      else
        encrypted_output[:encryption] << char
      end
    end
    encrypted_output
  end

  def decrypt(message, key = @key, date = @offset)
    decrypted_output = decrypt_hash(key, date)
    message.downcase.chars.each_with_index do |char, index|
      if @character_set.include?(char)
        new_char = rotated_set(-1, key, date, index)[find_index(char)]
        decrypted_output[:decryption] << new_char
      else
        decrypted_output[:decryption] << char
      end
    end
    decrypted_output
  end
end
