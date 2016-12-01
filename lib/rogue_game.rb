require 'byebug'
class Rogue_game < Gosu::Window



  def initialize
    super 640, 480
    self.caption = "roguelike"
    setup
    @entities = []

  end

  def map_reader
    @tiles = []
    File.readlines('maps/level1.csv').each do |box|
      @tiles << box.split(';')
    end
  end

  def content_reader
    @contents = []
    File.readlines('items/contents1.csv').each do |content|
      @contents << content.split(';')
    end
  end

  def enemy_reader
    @enemies = []
    File.readlines('items/enemies.txt').each do |enemy|
      @enemies << enemy.split(' ')
    end
  end

  def setup
    @items = []
    @enemylist = []
    map_reader
    content_reader
    enemy_reader

    y = 0
    while y < @tiles.size
      x = 0
      while x < @tiles[y].size
        if @tiles[y][x][0].to_s == 'w'
          @tiles[y][x] = Tile.create(x*16, y*16, 'w')
        elsif @tiles[y][x][0].to_s == 't'
          @tiles[y][x] = Tile.create(x*16, y*16, 't')
        end
        x += 1
      end
      y += 1
    end

    @enemies.each_with_index do |enemy, index|
      @enemies[index] = Enemy.new(enemy[1],enemy[2],enemy[0],@tiles[enemy[2].to_i/16][enemy[1].to_i/16])
    end

    @contents.each_with_index do |row,y|
      row.each_with_index do |box,x|
        if box[0].to_s == 'p'
          @items << Item.new(x*16,y*16,'p')
        end
      end
    end

    @player = Player.new(16,16,@tiles[1][1])
    @cm = Collision_manager.new(@player,@tiles,@enemies,@items)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      exit
    elsif id == Gosu::KbSpace

        @attack = @player.attack
        @enemylist.delete(@cm.attack(@attack))
    end

    @cm.button_down(id)

  end

  def update
    @cm.pick_up
  end

  def draw
    @player.draw
    @enemies.each do |enemy|
        if enemy != nil
          enemy.draw
        end
      end

    if @attack != nil
      @attack.draw
      @attack = nil
    end

    @tiles.each do |row|
      row.each do |tile|
      tile.draw
      end
    end

    @items.each do |item|
      item.draw
    end
   end
  end