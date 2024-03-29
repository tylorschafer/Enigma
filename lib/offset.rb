class Offset
  attr_reader :offset_shifts, :user_date

  def initialize(user_date = get_date.to_s)
    @offset_shifts = {}
    @user_date = user_date
  end

  def get_date
    Time.now.strftime("%m%d%y")
  end

  def square_date_offset(inputed_date = user_date)
    squared = inputed_date.to_i**2
      squared.to_s[-4..-1]
  end

  def create_offset_subshifts(offset = square_date_offset)
    @offset_shifts[:a] = offset[0].to_i
    @offset_shifts[:b] = offset[1].to_i
    @offset_shifts[:c] = offset[2].to_i
    @offset_shifts[:d] = offset[3].to_i
    @offset_shifts
  end
end
