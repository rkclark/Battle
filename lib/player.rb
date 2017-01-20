class Player

  attr_reader :name, :hitpoints

  DEFAULT_HP = 60
  MINIMUM_HP = 0

  def initialize(name:, hitpoints: DEFAULT_HP)
    @name = name
    @hitpoints = hitpoints
  end

  def receive_damage(damage)
    damage_breaches_min_hp?(damage) ? @hitpoints = MINIMUM_HP : @hitpoints -= damage
  end

  private

  def damage_breaches_min_hp?(damage)
    @hitpoints - damage < MINIMUM_HP
  end

end
