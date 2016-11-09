require 'byebug'
class Collision_manager

  def initialize(player,tiles,enemies,items)
    @player = player
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
    byebug
    if id == Gosu::KbLeft
      @walls.each do |wall|
        unless wall.x == @player.x-16 && wall.y == @player.y
          @player.move('l')
        end
      end
    elsif id == Gosu::KbRight &&
      @player.move('r')
    elsif id == Gosu::KbDown
      @player.move('w')
    elsif id == Gosu::KbUp
      @player.move('u')
    end
  end


end