class Tile

  attr_reader  :x, :y
  attr_accessor :enemy, :walkable


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
    @walkable = true
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

      super x, y
      @walkable = false
    end

end

class Floor < Tile
  def initialize(x, y)
    @image = Gosu::Image.new('media/tile.png')

    super x, y
    @walkable = true
    end
end