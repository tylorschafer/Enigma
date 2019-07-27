class Shift
  attr_reader :collected_shifts, :key_shifts, :offset_shifts

  def initialize(key = Key.new.random_key, offset = Offset.new.get_date)
    @collected_shifts = Hash.new(0)
    @key_shifts = Key.new(key).create_key_subshifts
    @offset_shifts = Offset.new(offset).create_offset_subshifts
  end

  def merge_subshifts
    @key_shifts.merge(@offset_shifts) do |key, key_shift, offset_shift|
      @collected_shifts[key] += (key_shift + offset_shift)
    end
    @collected_shifts
  end

end
