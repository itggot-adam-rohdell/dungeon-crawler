class Rogue_game < Gosu::Window

  def initialize
    super 640, 480
    self.caption = "roguelike"
    setup
    @entities = []
    @tiles = []
  end

  def map_reader
    @boxes = []
    File.readlines('maps/level1.csv').each do |box|
      @boxes << box.split(';')
    end
  end

  def setup
    map_reader
    @em = EntityManager.new(@entities)
    @player = Player.new(100,50,@em)

    @boxes.each_with_index do |row, y|
      row.each_with_index do |box, x|
      if box[0].to_s == 'w'
        @tiles << Tile.new(x,y,'w')
      elsif box[0].to_s == 't'
        @tiles << Tile.new(x,y,'t')
      end
     end
   end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      exit
    end

    @player.button_down(id)

  end

  def update

    if @player.attack
      @em.attack(@player)
    end

    @player.update
  end

  def draw
    @boxes.each_with_index do |row, y|
      row.each_with_index do |box, x|
        if box != ""
          @boxes[box.to_sym].draw(x*16, y*16, 0)
        end
      end
    end
    @player.draw

    @tiles.each do |tile|
      tile.draw
    end
  end
end