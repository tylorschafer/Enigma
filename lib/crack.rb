require './modules/enigma_helpers'
require './modules/crack_helpers'
class Crack
  include EnigmaHelpers
  include CrackHelpers

  def initialize
    @character_set = generate_character_set
  end

end
