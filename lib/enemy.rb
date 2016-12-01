class Enemy
  attr_accessor :x, :y, :current_tile
  attr_reader :value

  def initialize(x,y, hp, dmg, value, current_tile)
    @enemy = Gosu::Image.new("media/enemy.png")
    @hp = hp
    @damage = dmg
    @x = x
    @y = y
    @value = value
    @current_tile = current_tile
    @current_tile.walkable = false
  end

  def attack
  end

  def move
  end

  def get_attacked(damage)
    if damage >= @hp
      true
    else
      false
    end
  end

  def drop
  end

  def draw
    @enemy.draw(@x, @y, 1)
  end
end
