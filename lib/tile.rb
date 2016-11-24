class Tile

  attr_reader :walkable, :x, :y
  attr_accessor :enemy


  def self.create(x, y, value)
    if value == 'w'
      return Wall.new(x,y)
    else
      return Floor.new(x, y)
    end

  end

  def initialize(x,y)
    @x = x
    @y = y
    @walkable = false
  end

  def draw
    @image.draw(@x,@y, 0)
  end

  def add_enemy(enemy)
    @enemy = enemy
  end


end

class Wall < Tile

    def initialize(x, y)
      @image = Gosu::Image.new('media/wall.png')
      @walkable = false
      super x, y
    end


end

class Floor < Tile
  def initialize(x, y)
    @image = Gosu::Image.new('media/tile.png')
    @walkable = true
    super x, y
    end
end
