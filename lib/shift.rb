class Shift
  attr_reader :collected_shifts

  def initialize
    @collected_shifts = Hash.new(0)
    @key = Key.new
    @offset = Offset.new
  end

  def merge_subshifts

  end

end
