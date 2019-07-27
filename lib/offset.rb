class Offset
  attr_reader :offset_shifts

  def initialize
    @offset_shifts = {}
  end

  def get_date
    current_date = Time.now.strftime("%m%d%y")
  end

  def square_date_offset(inputed_date = get_date)
    squared = inputed_date.to_i**2
      squared.to_s[-4..-1]
  end
end
