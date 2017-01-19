require 'game.rb'

describe Game do

  let(:player_1) { instance_double("Player") }
  let(:player_2) { instance_double("Player") }
  subject(:game) { described_class.new(player_1: player_1, player_2: player_2) }

  before(:each) do
    allow(player_1).to receive(:name) { "Obama" }
    allow(player_2).to receive(:name) { "Trump" }
  end

  describe "#player_1" do
    it "returns player 1" do
      expect(game.player_1).to eq player_1
    end
  end

  describe "#player_2" do
    it "returns player 2" do
      expect(game.player_2).to eq player_2
    end
  end

  describe "#messages" do
    it "contains player1 vs player2 message" do
      expect(game.messages).to include( "#{player_1.name} and #{player_2.name} entered the game")
    end
  end

end
