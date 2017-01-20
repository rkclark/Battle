class Attack

  @attack_instance = nil
  ATTACK_MODIFIER = 10

  def initialize(game:, message_log:, randomiser_module:Randomiser)
    @game = game
    @message_log = message_log
    @randomiser = randomiser_module
    self.class.attack_instance = self
  end

  def run_attack(type)
    damage = random_damage
    game.inactive_player.receive_damage(damage)
    message_log.add_message("#{game.active_player.name} attacked #{game.inactive_player.name} for #{damage} HP!")
    game.decide_next_event
  end

  def self.attack_instance
    @attack_instance
  end

  def self.attack_instance=(value)
    @attack_instance = value
  end

  private

  def random_damage
    (randomiser.randomise * ATTACK_MODIFIER).to_i + 1
  end

  attr_reader :game, :message_log, :randomiser
end
