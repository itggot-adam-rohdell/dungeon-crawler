class Player

  attr_reader :damage, :desired_x, :desired_y
  attr_accessor :direction, :current_tile

  def initialize(x,y, current_tile)
    @player = Gosu::Image.new("media/player.png")
    @hp = 100
    @inventory = []
    @damage = 10
    @directions = [:l, :u, :r, :d]
    @direction = :r
    @current_tile = current_tile
    @current_tile.walkable = false
    @desired_x = x
    @desired_y = y

  end

  def x
    @current_tile.x
  end

  def y
    @current_tile.y
  end

  def move(tile)
    @current_tile = tile
    @current_tile.walkable = false
  end

  def desired_move(id)
    @desired_x = x
    @desired_y = y
    if id == :l
        return @desired_x = x - 16
    elsif id == :u
        return @desired_y = y - 16
    elsif id == :r
        return @desired_x = x + 16
    else
        return @desired_y = y + 16
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
      return Attack.new(x - 16, y, @damage)
    elsif @direction == :r
      return Attack.new(x + 16, y, @damage)
    elsif @direction == :u
      return Attack.new(x, y - 16, @damage)
    elsif @direction == :d
      return Attack.new(x, y + 16, @damage)
    end
  end

  def get_attacked

  end

  def use_item
  end

  def draw
    @player.draw(x,y, 1)
  end

end
