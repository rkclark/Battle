class Attack

  def initialize(game:, message_log:)
    @game = game
    @message_log = message_log
  end

  def run_attack
    game.inactive_player.receive_damage
    message_log.add_message("#{game.active_player.name} attacked #{game.inactive_player.name}")
    game.switch_turn
  end

  private

  attr_reader :game, :message_log
end
