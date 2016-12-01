require "byebug"
class Enemy
  attr_accessor :x, :y, :current_tile
  attr_reader :value

  def initialize(x,y, value, current_tile)
    @enemy = Gosu::Image.new("media/enemy.png")
      if value == 'e'
        @hp = 10
        @attack = 10
      elsif value == 'b'
        @hp = 100
        @attack = 20
      end
    @x = x.to_i
    @y = y.to_i
    @value = value
    @current_tile = current_tile
    @current_tile.walkable = false

  end

  def attack
  end

  def move
    puts 'Gustav är söt'
    if rand(2) == 1
     @x += (rand(2) == 0 ? -1 : 1)*16
    else
     @y += (rand(2) == 0 ? -1 : 1)*16
    end
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
