class Game

  attr_reader :player_1, :player_2

 def initialize(player_1:, player_2:)
   @player_1 = player_1
   @player_2 = player_2
   @messages = ["#{player_1.name} and #{player_2.name} entered the game"]
 end

  def attack(player)
    player.receive_damage
    add_message("#{player_1.name} attacked #{player_2.name}")
  end

  def messages
    @messages
  end

  private

  def add_message(message)
    @messages << message
  end
end
