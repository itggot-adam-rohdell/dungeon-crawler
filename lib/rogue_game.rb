class Rogue_game

  def initialize
    super 640, 480
    self.caption = "roguelike"
  end

  def setup
    @em = EntityManager.new(entities)
    @player = Player.new(x,y, em)
  end

  def update

    if @player.attack
      em.attack(@player)
    end

  end

  def draw

  end
end