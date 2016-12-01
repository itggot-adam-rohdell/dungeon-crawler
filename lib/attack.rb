class Attack

  attr_accessor :x, :y, :damage
  def initialize (x, y, damage)
    @attack = Gosu::Image.new("media/attack.png")
    @x = x
    @y = y
    @damage = damage
  end

  def draw
    @attack.draw(@x, @y, 1)
  end

end