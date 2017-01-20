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
    route_attack(type)
    game.decide_next_event
  end

  def self.attack_instance
    @attack_instance
  end

  def self.attack_instance=(value)
    @attack_instance = value
  end

  private

  def add_message(message)
    message_log.add_message(message)
  end

  def route_attack(type)
    case type
      when 'normal'
        p 'NORMAL ATTACK'
        normal_attack
      when 'paralyse'
        paralyse_attack
      when 'sleep'
        sleep_attack
      when 'poison'
        poison_attack
      when 'heal'
        heal_attack
    end
  end

  def normal_attack
    damage = random_damage
    game.inactive_player.receive_damage(damage)
    add_message("#{game.active_player.name} attacked #{game.inactive_player.name} for #{damage} HP!")
  end

  def random_damage
    (randomiser.randomise * ATTACK_MODIFIER).to_i + 1
  end

  attr_reader :game, :message_log, :randomiser
end
