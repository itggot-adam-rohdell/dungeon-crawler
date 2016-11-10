class Player

  attr_reader :damage
  attr_reader :x
  attr_reader :y
  attr_reader :direction

  def initialize(x,y,em)
    @player = Gosu::Image.new("media/player.png")
    @hp = 100
    @inventory = []
    @damage = 10
    @x = x
    @y = y
    @directions = [:l, :u, :r, :d]
    @direction = 1
    @em = em
  end

  def update

  end

  def move(id)
    if id == 'l'
      @x -=16
      @direction = @directions[0]
    elsif id == 'u'
      @y -=16
      @direction = @directions[1]
    elsif id == 'r'
      @x += 16
      @direction = @directions[2]
    else
      @y += 16
      @direction = @directions[3]
    end
  end


  def pick_up(item)
    if item == 'p'
      @inventory << 'potion'
      puts @inventory
    end
  end

  def attack
    if @direction == :l
      Attack.new(@x - 16, @y, @damage)
    elsif @direction == :r
      Attack.new(@x + 16, @y, @damage)
    elsif @direction == :u
      Attack.new(@x, @y - 16, @damage)
    elsif @direction == :d
      Attack.new(@x, @y + 16, @damage)
    end
  end

  def get_attacked

  end

  def use_item
  end

  def draw
    @player.draw(@x,@y, 1)
  end

end