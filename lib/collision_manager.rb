require 'byebug'
class Collision_manager

  def initialize(player,tiles,enemies,items)
    @player = player
    @items = items
    @tiles = tiles
    @enemies = enemies

  end

  def button_down(id)

    if id == Gosu::KbLeft
       if if_walkable_move(@tiles, :l)
       else if_walkable_move(@enemies, :l)
       end
    elsif id == Gosu::KbRight
      if if_walkable_move(@tiles, :r)
      else if_walkable_move(@enemies, :r)
      end
    elsif id == Gosu::KbUp
      if if_walkable_move(@tiles, :u)
      else if_walkable_move(@enemies, :u)
      end
    elsif id == Gosu::KbDown
      if if_walkable_move(@tiles, :d)
      else if_walkable_move(@enemies, :d)
      end
    end
  end
=begin    elsif id == Gosu::KbRight
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
=end


    def if_walkable_move(array, direction)

      if @player.direction == direction
        if direction == :l
          unless array[@player.y / 16][(@player.x - 16) / 16] == nil
            if array[@player.y / 16][(@player.x - 16) / 16].walkable
            @player.move(direction.to_s)
            end
          end
        elsif direction == :r
          unless array[@player.y / 16][(@player.x + 16) / 16] == nil
            if array[@player.y / 16][(@player.x + 16) / 16].walkable
              @player.move(direction.to_s)
            end
          end
        elsif direction == :d
          unless array[(@player.y + 16) / 16][@player.x / 16] == nil
            if array[(@player.y + 16) / 16][@player.x / 16].walkable
              @player.move(direction.to_s)
            end
          end
        elsif direction == :u
          if array[(@player.y - 16) / 16][@player.x / 16] == nil
           @player.move(direction.to_s)
          elsif array[(@player.y - 16) / 16][@player.x / 16].walkable
             @player.move(direction.to_s)
          end
        end
        else @player.direction = direction
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
=begin
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
=end

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
