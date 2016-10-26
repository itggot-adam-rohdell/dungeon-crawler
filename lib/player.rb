class Player

  attr_accessor :attack
  def initialize(x,y, em)
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

  def pick_up

  end

  def move
  end

  def action
    @attack = true
  end

  def get_attacked

  end

  def use_item
  end

  def draw
    @player.draw(@x,@y, 0)
  end

end