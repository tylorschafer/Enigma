class Key
  attr_reader :user_key, :key_shifts

  def initialize(user_key = nil)
    @user_key = user_key
    @key_shifts = Hash.new(0)
  end

end
