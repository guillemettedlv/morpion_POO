class Game

  attr_accessor :human_player, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies = [Player.new("Josiane"),Player.new("José"),Player.new("Paul"),Player.new("Paulette")]

  end

  def self.kill_player(enemy)
    @enemies.delete(enemy)
    print @enemies
  end

end