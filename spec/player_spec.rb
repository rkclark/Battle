require 'player'

describe Player do
  let(:name) { "Obama" }
  subject(:player) { described_class.new(name: name) }
  it "returns correct name" do
    expect(player.name).to eq "Obama"
  end
end
