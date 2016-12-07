require "byebug"
class Enemy
  attr_accessor :current_tile, :desired_x, :desired_y
  attr_reader :value

  def initialize(value, current_tile)
    @enemy = Gosu::Image.new("media/enemy.png")
      if value == 'e'
        @hp = 10
        @attack = 10
      elsif value == 'b'
        @hp = 100
        @attack = 20
      end

    @value = value
    @current_tile = current_tile
    @current_tile.walkable = false

  end

  def x
      @current_tile.x
  end

  def y
      @current_tile.y
  end

  def attack
  end

  def move(tile)
     @current_tile = tile
  end

  def desired_move
      @desired_x = x
      @desired_y = y
    puts 'Gustav är söt'
    if rand(2) == 1
     return @desired_x = x + (rand(2) == 0 ? -1 : 1)*16
    else
     return @desired_y = y + (rand(2) == 0 ? -1 : 1)*16
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
    @enemy.draw(x, y, 1)
  end
end
