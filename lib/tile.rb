class Tile

  attr_reader :value
  attr_reader :x
  attr_reader :y
  def initialize(x,y,value)
    if value == 't'
      @tile = Gosu::Image.new('media/tile.png')
    elsif value == 'w'
      @tile = Gosu::Image.new('media/wall.png')
    end
    @value = value
    @x = x
    @y = y
  end

  def draw
    @tile.draw(@x,@y, 0)
  end


end