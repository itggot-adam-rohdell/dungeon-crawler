class Item

  attr_reader :value
  attr_reader :x
  attr_reader :y

  def initialize(x,y,value)
    @value = value
      if @value == 'p'
        @item = Gosu::Image.new('media/potion.png')
      end
    @x = x
    @y = y
  end



  def draw
    @item.draw(@x,@y,0)
  end
end