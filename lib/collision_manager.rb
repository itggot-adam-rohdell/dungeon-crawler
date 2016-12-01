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
       if_walkable_move(@tiles, :l)
    elsif id == Gosu::KbRight
      if_walkable_move(@tiles, :r)
    elsif id == Gosu::KbUp
      if_walkable_move(@tiles, :u)
    elsif id == Gosu::KbDown
      if if_walkable_move(@tiles, :d)
        @enemies.each do |enemy|
          enemy.move
        end
      end
    end
  end

    def if_walkable_move(array, direction)

      if @player.direction == direction
        if direction == :l
            if array[@player.y / 16][(@player.x - 16) / 16].walkable
              @player.current_tile.walkable = true
              @player.current_tile = array[@player.y / 16][(@player.x - 16) / 16]
              @player.move(direction.to_s)

            end
        elsif direction == :r
            if array[@player.y / 16][(@player.x + 16) / 16].walkable
              @player.current_tile.walkable = true
              @player.current_tile = array[@player.y / 16][(@player.x + 16) / 16]
              @player.move(direction.to_s)

            end
        elsif direction == :d
            if array[(@player.y + 16) / 16][@player.x / 16].walkable
              @player.current_tile.walkable = true
              @player.current_tile = array[(@player.y + 16) / 16][@player.x / 16]
              @player.move(direction.to_s)

            end
        elsif direction == :u
            if array[(@player.y - 16) / 16][@player.x / 16].walkable
              @player.current_tile.walkable = true
              @player.current_tile = array[(@player.y - 16) / 16][@player.x / 16]
               @player.move(direction.to_s)

            end
        end
        return true
      else @player.direction = direction
        return false
    end
  end

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
    @enemies.each_with_index do |enemy, index|
      if enemy.x == attack.x && enemy.y == attack.y
         if enemy.get_attacked(attack.damage)
            @enemies.delete_at(index)
            enemy.current_tile.walkable = true
           end
        end
    end
  end
end