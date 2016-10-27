class Tile

  def initialize(x,y,value)
    if value == 't'
      @tile = Gosu::Image.new('media/tile.png')
    elsif value == 'w'
      @tile = Gosu::Image.new('media/wall.png')
    end

    @x = x
    @y = y
  end

  def draw
    @tile.draw(@x,@y, 0)
  end


end