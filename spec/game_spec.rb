require 'game.rb'

describe Game do

  let(:player_1) { instance_double("Player") }
  let(:player_2) { instance_double("Player") }
  subject(:game) { described_class.new(player_1: player_1, player_2: player_2) }

  describe "#attack" do
    it "calls reduce_damage on target player" do
      allow(player_2).to receive(:receive_damage)
      expect{game.attack(player_2)}.not_to raise_error
    end
  end


end
