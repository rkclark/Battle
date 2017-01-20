class Attack

  @attack_instance = nil
  NORMAL_ATTACK_MODIFIER = 10
  PARALYSE_ATTACK_MODIFIER = 5

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
        normal_attack(NORMAL_ATTACK_MODIFIER, type)
      when 'paralyse'
        normal_attack(PARALYSE_ATTACK_MODIFIER, type)
        paralyse_attack
      when 'sleep'
        sleep_attack
      when 'poison'
        poison_attack
      when 'heal'
        heal_attack
    end
  end

  def normal_attack(modifier, type)
    damage = random_damage(modifier)
    game.inactive_player.receive_damage(damage)
    add_message("#{game.active_player.name} attacked #{game.inactive_player.name} with #{type.capitalize} Attack for #{damage} HP!")
  end

  def paralyse_attack
    if random_boolean
      player.toggle_paralysed
      add_message("#{game.inactive_player} was Paralysed!")
    else
      add_message("#{game.inactive_player} resisted Paralyse!")
    end
  end

  def random_damage(modifier)
    (random_number * modifier).to_i + 1
  end

  def random_boolean
    random_number > 0.5
  end

  def random_number
    randomiser.randomise
  end

  attr_reader :game, :message_log, :randomiser
end
