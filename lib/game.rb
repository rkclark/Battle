class Game

  attr_reader :player_1, :player_2, :message_log, :active_player

  @game_instance = nil

 def initialize(player_1:, player_2:, message_log:)
   @player_1 = player_1
   @player_2 = player_2
   @message_log = message_log
   @active_player = player_1
   @message_log.add_message("#{player_1.name} and #{player_2.name} entered the game")
   self.class.game_instance = self
 end

  def inactive_player
    @active_player == player_1 ? player_2 : player_1
  end

  def decide_next_event
    if game_won?
      @message_log.add_message("#{inactive_player.name} reaches 0 HP!")
      @message_log.add_message("#{active_player.name} wins!")
    else
      switch_turn
    end
  end

  def self.game_instance
    @game_instance
  end

  def self.game_instance=(value)
    @game_instance = value
  end

  private

  def switch_turn
    active_player == player_1 ? @active_player = player_2 : @active_player = player_1
  end

  def game_won?
    (player_1.hitpoints <= 0 || player_2.hitpoints <= 0) ? true : false
  end

end
