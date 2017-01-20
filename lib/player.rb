class Player

  attr_reader :name, :hitpoints

  DEFAULT_HP = 60
  MINIMUM_HP = 0

  def initialize(name:, hitpoints: DEFAULT_HP, human: true)
    @name = name
    @hitpoints = hitpoints
    @human = human
  end

  def receive_damage(damage)
    damage_breaches_min_hp?(damage) ? @hitpoints = MINIMUM_HP : @hitpoints -= damage
  end

  def human?
    @human
  end

  private

  def damage_breaches_min_hp?(damage)
    @hitpoints - damage < MINIMUM_HP
  end

end
