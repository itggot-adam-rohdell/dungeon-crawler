class Tile

  attr_reader :value
  attr_reader :x
  attr_reader :y

  def initialize(x,y,value)
    @value = value
    if @value == 't'
      @tile = Gosu::Image.new('media/tile.png')
      Floor.new(@x,@y,0)
    elsif @value == 'w'
      @tile = Gosu::Image.new('media/wall.png')
      Wall.new(@x,@y,0)
    end
    @enemy = false
    @x = x
    @y = y
  end

  def draw
    @tile.draw(@x,@y, 0)
  end


end

class Wall < Tile

end

class Floor < Tile

end