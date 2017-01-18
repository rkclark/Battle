require 'player'

describe Player do
  let(:name) { "Obama" }
  subject(:player) { described_class.new(name: name) }
  it "returns correct name" do
    expect(player.name).to eq "Obama"
  end
  it "can receive damage" do
    expect{player.receive_damage}.to change{player.hitpoints}.by -10
  end
  it "can return its HP" do
    expect(player).to respond_to(:hitpoints)
  end
end
