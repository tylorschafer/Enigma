module Rotate

  def generate_character_set
    ("a".."z").to_a << " "
  end

  def get_shifts(key, offset)
    Shift.new(key, offset).merge_subshifts
  end

  def find_index(char)
    @character_set.index(char)
  end

  def template_hash(symbol, key, date)
    {symbol => "",
     :key => key,
     :date => date}
  end

  def rotate_set(direction = 1, key, offset, index)
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:a]) if index == 0 || index % 4 == 0
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:b]) if index == 1 || index % 4 == 1
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:c]) if index == 2 || index % 4 == 2
    return @character_set
      .rotate((direction) * get_shifts(key,offset)[:d]) if index == 3 || index % 4 == 3
  end

  def rotate_message(direction = 1, symbol, message, key, date)
    output_hash = template_hash(symbol, key, date)
    message.downcase.chomp.chars.each_with_index do |char, index|
      if @character_set.include?(char)
        new_char = rotate_set(direction, key, date, index)[find_index(char)]
        output_hash[symbol] << new_char
      else
        output_hash[symbol] << char
      end
    end
    output_hash
  end
end
