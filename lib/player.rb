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
    @direction = :r
    @em = em
  end

  def move(id)
    if id == 'l'
      if @direction == @directions[0]
        @x -=16
      else
        @direction = @directions[0]
      end
    elsif id == 'u'
      if @direction == @directions[1]
        @y -=16
      else
        @direction = @directions[1]
      end
    elsif id == 'r'
      if @direction == @directions[2]
        @x += 16
      else
        @direction = @directions[2]
      end
    else
      if @direction == @directions[3]
        @y += 16
      else
        @direction = @directions[3]
      end
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
      return Attack.new(@x - 16, @y, @damage)
    elsif @direction == :r
      return Attack.new(@x + 16, @y, @damage)
    elsif @direction == :u
      return Attack.new(@x, @y - 16, @damage)
    elsif @direction == :d
      return Attack.new(@x, @y + 16, @damage)
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
