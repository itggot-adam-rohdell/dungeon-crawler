
class Collision_manager

  def initialize(player,tiles,enemies,items)
    @player = player
    @items = items
    @tiles = tiles
    @enemies = enemies

  end

  def button_down(id)

    if id == Gosu::KbLeft
      if @player.direction == :l
        unless @tiles[@player.y / 16][(@player.x - 16) / 16].value == "w"
          @player.move('l')
        end
      else @player.direction = :l
      end
    elsif id == Gosu::KbRight
      if @player.direction == :r
        unless @tiles[@player.y / 16][(@player.x + 16) / 16].value == "w"
          @player.move('r')
        end
      else @player.direction = :r
      end
    elsif id == Gosu::KbDown
      if @player.direction == :d
        unless @tiles[(@player.y + 16) / 16][(@player.x) / 16].value == "w"
          @player.move('d')
        end
      else @player.direction = :d
      end
    elsif id == Gosu::KbUp
      if @player.direction == :u
        unless @tiles[(@player.y - 16)/ 16][(@player.x) / 16].value == "w"
          @player.move('u')
        end
      else @player.direction = :u
      end
    end
=begin
      if tile.value == "w"
        if tile.x == @player.x-16 && tile.y == @player.y
          unwalkable << 'left'
        elsif tile.x == @player.x+16 && tile.y == @player.y
          unwalkable << 'right'
        elsif tile.x == @player.x && tile.y == @player.y+16
          unwalkable << 'down'
        elsif tile.x == @player.x && tile.y == @player.y-16
          unwalkable << 'up'
        end
      end
=end
      @enemies.each do |enemy|
        if enemy.x == @player.x-16 && enemy.y == @player.y
          unwalkable << 'left'
      elsif enemy.x == @player.x+16 && enemy.y == @player.y
          unwalkable << 'right'
      elsif enemy.x == @player.x && enemy.y == @player.y+16
          unwalkable << 'down'
      elsif enemy.x == @player.x && enemy.y == @player.y-16
          unwalkable << 'up'
        end
      end
  end



=begin
    if id == Gosu::KbLeft && unwalkable.include?('left') == false
       @player.move('l')
    elsif id == Gosu::KbRight && unwalkable.include?('right') == false
        @player.move('r')
    elsif id == Gosu::KbDown && unwalkable.include?('down') == false
      @player.move('d')
    elsif id == Gosu::KbUp && unwalkable.include?('up') == false
      @player.move('u')
    end
=end

  def pick_up
    @items.each do |item|
      if item.x == @player.x && item.y == @player.y
        puts item.value
        @player.pick_up(item.value)
        @items.delete(item)
      end
    end
  end

  def attack(attack)
    @enemies.each do |enemy|
      if enemy.x == attack.x && enemy.y == attack.y
         if enemy.get_attacked(attack.damage)
            return enemy
        end
      end
    end
  end

end
