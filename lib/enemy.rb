class Enemy
  attr_accessor :x, :y
  attr_reader :value

  def initialize(x,y, hp, dmg, value)
    @enemy = Gosu::Image.new("media/enemy.png")
    @hp = hp
    @damage = dmg
    @x = x
    @y = y
    @value = value
  end

  def attack
  end

  def move
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
    @enemy.draw(@x, @y, 1)
  end
end
