class Offset
  attr_reader :offset_shifts

  def initialize
    @offset_shifts = Hash.new(0)
  end

  def get_date
    current_date = Time.now.strftime("%m%d%y")
  end

  def square_date
    
  end
end
