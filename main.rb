require 'gosu'
require_relative 'lib/rogue_game'
require_relative 'lib/player'
require_relative 'lib/enemy'
require_relative 'lib/tile'
require_relative 'lib/collision_manager'
require_relative 'lib/item'
require_relative 'lib/attack'

class String

  def value
    self
  end

end


ng = Rogue_game.new
ng.show
