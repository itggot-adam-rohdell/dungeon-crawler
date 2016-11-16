class Rogue_game < Gosu::Window

  def initialize
    super 640, 480
    self.caption = "roguelike"
    setup
    @entities = []

  end

  def map_reader
    @boxes = []
    File.readlines('maps/level1.csv').each do |box|
      @boxes << box.split(';')
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
    File.readlines('items/enemies.csv').each do |enemy|
      @enemies << enemy.split(';')
    end
  end

  def setup
    @items = []
    @tiles = []
    @enemylist = []
    map_reader
    content_reader
    enemy_reader
    @boxes.each_with_index do |row, y|
      row.each_with_index do |box, x|
      if box[0].to_s == 'w'
        @tiles << Tile.new(x*16,y*16,'w')
      elsif box[0].to_s == 't'
        @tiles << Tile.new(x*16,y*16,'t')
      end
     end
    end
    @contents.each_with_index do |row,y|
      row.each_with_index do |box,x|
        if box[0].to_s == 'p'
          @items << Item.new(x*16,y*16,'p')
        end
      end
    end
    @enemies.each_with_index do |row,y|
      row.each_with_index do |box,x|
        if box[0].to_s == 'e'
          @enemylist << Enemy.new(x*16,y*16,10,0)
        end
      end
    end
    @em = EntityManager.new(@entities)
    @player = Player.new(16,16,@em)
    @cm = Collision_manager.new(@player,@tiles,@enemylist,@items)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      exit
    elsif id == Gosu::KbSpace
      @attack = @player.attack
      if @cm.attack(@attack)
        @enemy = nil
      end
    end

    @cm.button_down(id)

  end

  def update
    @cm.pick_up
  end

  def draw
    @player.draw
    @enemylist.each do |enemy|
      if enemy != nil
        enemy.draw
      end
    end

    if @attack != nil
      @attack.draw
      @attack = nil
    end
    @tiles.each do |tile|
      tile.draw
    end
    @items.each do |item|
      item.draw
    end
  end
end