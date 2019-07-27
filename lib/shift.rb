class Shift
  attr_reader :collected_shifts

  def initialize
    @collected_shifts = Hash.new(0)
  end

end
