class Enigma
  attr_reader :character_set

  def initialize
    @key = Key.new.random_key
    @offset = Offset.new.get_date
    @character_set = generate_character_set
    @enrypt_output = {
      :encryption => "",
      :key => nil,
      :date => nil
    }
  end

  def generate_character_set
    ("a".."z").to_a << " "
  end

  def get_shifts(key, offset)
    Shift.new(key, offset).merge_subshifts
  end

  def find_index(char)
    @character_set.index(char)
  end

  def find_char(index)
    @character_set[index]
  end

  def rotated_set(key, offset, index)
    return @character_set.rotate(get_shifts(key,offset)[:a]) if index == 0
    return @character_set.rotate(get_shifts(key,offset)[:b]) if index == 1
    return @character_set.rotate(get_shifts(key,offset)[:c]) if index == 2
    return @character_set.rotate(get_shifts(key,offset)[:d]) if index == 3
  end

  # def encrypt(message = @message, key = @key, date = @offset)
  #   message.chars.each_with_index do |char, index|
  #     rotated_set(index)
  #     @encrypt_output[:encryption] <<
  #   end
  # end
end
