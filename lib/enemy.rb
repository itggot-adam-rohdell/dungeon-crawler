class Enemy
  attr_accessor :x, :y
  def initialize(x,y, hp, dmg)
    @enemy = Gosu::Image.new("media/enemy.png")
    @hp = hp
    @damage = dmg
    @x = x
    @y = y
  end

  def attack
  end

  def move
  end

  def get_attacked(damage)
    if damage >= @hp
      true
    end
  end

  def drop
  end

  def draw
    @enemy.draw(@x, @y, 1)
  end
end