require 'player'

describe Player do
  let(:name) { "Obama" }
  subject(:player) { described_class.new(name: name) }
  DEFAULT_HP = described_class::DEFAULT_HP
  it "returns correct name" do
    expect(player.name).to eq "Obama"
  end
  it "can receive damage" do
    expect{player.receive_damage(2)}.to change{player.hitpoints}.by -2
  end
  it "will not allow HP to go below 0" do
    expect{player.receive_damage(DEFAULT_HP + 2)}.to change{player.hitpoints}.by -DEFAULT_HP
  end
  it "can return its HP" do
    expect(player).to respond_to(:hitpoints)
  end
  it "stores whether it is human or computer controlled"do
    expect(player).to respond_to(:human?)
  end
  it "has no true status effects at start of game" do
    expect(player.paralysed?).to be false
    expect(player.sleeping?).to be false
    expect(player.poisoned?).to be false
  end
  it "can toggle all status effects" do
    player.toggle_paralysed
    player.toggle_sleeping
    player.toggle_poisoned
    expect(player.paralysed?).to be true
    expect(player.sleeping?).to be true
    expect(player.poisoned?).to be true
  end
end
