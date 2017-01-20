require "attack.rb"

describe Attack do

  let(:player_1) { instance_double("Player") }
  let(:player_2) { instance_double("Player") }
  let(:game) { instance_double("Game") }
  let(:message_log) {instance_double("MessageLog")}
  subject(:attack) { described_class.new(game: game, message_log: message_log) }


  describe "#run_attack" do
    before(:each) do
      allow(player_1).to receive(:name) { "Obama" }
      allow(player_2).to receive(:name) { "Trump" }
      allow(game).to receive(:inactive_player) { player_2 }
      allow(game).to receive(:active_player) { player_1 }
      allow(message_log).to receive(:add_message)
      allow(game).to receive(:decide_next_event)
      allow(player_2).to receive(:receive_damage).with(2)
    end
    it "passes randomised attack damage to receive_damage" do
      srand(1234)
      attack.run_attack
      expect(player_2).to have_received(:receive_damage).with(2)
    end
  end
end
