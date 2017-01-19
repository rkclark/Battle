class Game

  attr_reader :player_1, :player_2, :message_log

 def initialize(player_1:, player_2:, message_log:)
   @player_1 = player_1
   @player_2 = player_2
   @message_log = message_log
   @turn = @player_1
   @message_log.add_message("#{player_1.name} and #{player_2.name} entered the game")
 end

  def active_player
    @turn
  end

  def inactive_player
    @turn == player_1 ? player_2 : player_1
  end

  def switch_turn
    active_player == player_1 ? @turn = player_2 : @turn = player_1
  end

  private



end
