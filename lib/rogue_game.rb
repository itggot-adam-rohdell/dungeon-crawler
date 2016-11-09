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

  def setup
    @tiles = []
    map_reader
    @em = EntityManager.new(@entities)
    @player = Player.new(16,16,@em)
    @cm = Collision_manager.new(@player,@tiles,0,0)

    @boxes.each_with_index do |row, y|
      row.each_with_index do |box, x|
      if box[0].to_s == 'w'
        @tiles.push(Tile.new(x*16,y*16,'w'))
      elsif box[0].to_s == 't'
        @tiles.push(Tile.new(x*16,y*16,'t'))
      end
     end
   end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      exit
    end

    @cm.button_down(id)

  end

  def update

    if @player.attack
      @em.attack(@player)
    end

    @player.update
  end

  def draw
    @player.draw

    @tiles.each do |tile|
      tile.draw
    end
  end
end