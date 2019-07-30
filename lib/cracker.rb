require './modules/shift_finder'
require './modules/rotate'
class Cracker
  include Rotate
  include ShiftFinder

  def initialize(date = Offset.new.get_date)
    @date = date.to_s
    @offset_shifts = Offset.new(date).create_offset_subshifts
    @character_set = generate_character_set
  end

  def crack_key(message)
    key = (0..99999).find do |num|
      found_num = num.to_s.rjust(5, '0')
      (found_num[0..1].to_i + @offset_shifts[:a]) % 27 == assign_shifts(message)[:a] &&
      (found_num[1..2].to_i + @offset_shifts[:b]) % 27 == assign_shifts(message)[:b] &&
      (found_num[2..3].to_i + @offset_shifts[:c]) % 27 == assign_shifts(message)[:c] &&
      (found_num[3..4].to_i + @offset_shifts[:d]) % 27 == assign_shifts(message)[:d]
    end
    key.to_s.rjust(5, '0')
  end
end
