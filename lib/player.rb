class Player

  attr_accessor :attack
  attr_reader :x
  attr_reader :y

  def initialize(x,y,em)
    @player = Gosu::Image.new("media/player.png")
    @hp = 100
    @inventory = []
    @damage = 10
    @x = x
    @y = y
    @em = em
    @attack = false
  end

  def update

  end

  def move(id)
    if id == 'l'
      @x -=16
    elsif id == 'u'
      @y -=16
    elsif id == 'r'
      @x += 16
    else
      @y += 16
    end
  end


  def pick_up

  end

  def action
    !@attack
  end

  def get_attacked

  end

  def use_item
  end

  def draw
    @player.draw(@x,@y, 1)
  end

end