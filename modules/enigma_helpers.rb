module EnigmaHelpers

  def generate_character_set
    ("a".."z").to_a << " "
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

  def get_shifts(key, offset)
    Shift.new(key, offset).merge_subshifts
  end

  def find_index(char)
    @character_set.index(char)
  end

  def rotated_set(direction = 1, key, offset, index)
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:a]) if index == 0 || index % 4 == 0
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:b]) if index == 1 || index % 4 == 1
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:c]) if index == 2 || index % 4 == 2
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:d]) if index == 3 || index % 4 == 3
  end

  def rotate_message(direction = 1, message, key, date)
    encrypt = encrypt_hash(key,date); decrypt = decrypt_hash(key,date)
    message.downcase.chomp.chars.each_with_index do |char, index|
      if @character_set.include?(char)
        new_char = rotated_set(direction, key, date, index)[find_index(char)]
        encrypt[:encryption] << new_char if direction == 1
        decrypt[:decryption] << new_char if direction == -1
      else
        encrypt[:encryption] << char if direction == 1
        decrypt[:decryption] << char if direction == -1
      end
    end
    return encrypt if direction == 1 else decrypt
  end
end
