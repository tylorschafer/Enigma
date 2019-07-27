require './modules/enigma_helpers'
class Enigma
  include EnigmaHelpers
  attr_reader :character_set

  def initialize
    @key = Key.new.random_key
    @offset = Offset.new.get_date
    @character_set = generate_character_set
    @encrypt_output = {
      :encryption => "",
      :key => nil,
      :date => nil
    }
    @decrypt_output = {
      :decryption => "",
      :key => nil,
      :date => nil
    }
  end

  def encrypt(message = @message, key = @key, date = @offset)
    message.chars.each_with_index do |char, index|
      new_char = rotated_set(key, date, index)[find_index(char)]
      @encrypt_output[:encryption] << new_char
      @encrypt_output[:key] = key
      @encrypt_output[:date] = date
    end
    @encrypt_output
  end

  def decrypt(message = @message, key = @key, date = @offset)
    message.chars.each_with_index do |char, index|
      new_char = rotated_set(-1, key, date, index)[find_index(char)]
      @decrypt_output[:decryption] << new_char
      @decrypt_output[:key] = key
      @decrypt_output[:date] = date
    end
    @decrypt_output
  end
end
