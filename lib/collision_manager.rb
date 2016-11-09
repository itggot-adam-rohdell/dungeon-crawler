
class Collision_manager

  def initialize(player,tiles,enemies,items)
    @player = player
    @items = items
    @walls = []
    @tiles = []
    tiles.each do |tile|
      if tile.value == 'w'
        @walls << tile
      elsif tile.value == 't'
        @tiles << tile
      end
    end

  end

  def button_down(id)
    unwalkable = []
    @walls.each do |wall|
      if wall.x == @player.x-16 && wall.y == @player.y
        unwalkable << 'left'
      elsif wall.x == @player.x+16 && wall.y == @player.y
        unwalkable << 'right'
      elsif wall.x == @player.x && wall.y == @player.y+16
        unwalkable << 'down'
      elsif wall.x == @player.x && wall.y == @player.y-16
        unwalkable << 'up'
      end
    end

    if id == Gosu::KbLeft && unwalkable.include?('left') == false
       @player.move('l')
    elsif id == Gosu::KbRight && unwalkable.include?('right') == false
        @player.move('r')
    elsif id == Gosu::KbDown && unwalkable.include?('down') == false
      @player.move('d')
    elsif id == Gosu::KbUp && unwalkable.include?('up') == false
      @player.move('u')
    end
  end

  def pick_up
    @items.each do |item|
      if item.x == @player.x && item.y == @player.y
        @player.pick_up(item.value)
      end
    end
  end


end