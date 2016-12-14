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
       if if_walkable_move(@player, @tiles, :l)
           if_walkable_move(@enemies[0], @tiles, :e)
       end
    elsif id == Gosu::KbRight
       if if_walkable_move(@player, @tiles, :r)
           if_walkable_move(@enemies[0], @tiles, :e)
       end
    elsif id == Gosu::KbUp
       if if_walkable_move(@player, @tiles, :u)
           if_walkable_move(@enemies[0], @tiles, :e)
       end
    elsif id == Gosu::KbDown
       if if_walkable_move(@player, @tiles, :d)
           if_walkable_move(@enemies[0], @tiles, :e)
       end 
    end
  end

    def if_walkable_move(character, array, direction)
        if character.class == Player
          if character.direction == direction
            character.desired_move(direction)
            if array[(character.desired_y / 16)][character.desired_x / 16].walkable
              character.current_tile.walkable = true
              character.move(array[(character.desired_y / 16)][(character.desired_x / 16)])
            end

            return true
          else @player.direction = direction
            return false
          end
    elsif character.class == Enemy
        @enemies.each do |enemy|
            enemy.desired_move
            if array[(enemy.desired_y / 16)][(enemy.desired_x / 16)].walkable
                enemy.current_tile.walkable = true
                enemy.move(array[(enemy.desired_y / 16)][(enemy.desired_x / 16)])
            end
        end
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
