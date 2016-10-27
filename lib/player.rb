class Player

  attr_accessor :attack

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

  def button_down(id)
    if id == Gosu::KbLeft
      @x -= 16

    elsif id == Gosu::KbRight
      @x += 16

    elsif id == Gosu::KbDown
      @y += 16
    elsif id == Gosu::KbUp
      @y -= 16
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