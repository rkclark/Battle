class Attack

  @attack_instance = nil

  def initialize(game:, message_log:)
    @game = game
    @message_log = message_log
    self.class.attack_instance = self
  end

  def run_attack
    game.inactive_player.receive_damage
    message_log.add_message("#{game.active_player.name} attacked #{game.inactive_player.name}")
    game.decide_next_event
  end

  def self.attack_instance
    @attack_instance
  end

  def self.attack_instance=(value)
    @attack_instance = value
  end

  private

  attr_reader :game, :message_log
end
