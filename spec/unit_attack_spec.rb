require "attack.rb"

describe Attack do

  let(:player_1) { instance_double("Player") }
  let(:player_2) { instance_double("Player") }
  let(:game) { instance_double("Game") }
  let(:message_log) {instance_double("MessageLog")}
  subject(:attack) { described_class.new(game: game, message_log: message_log) }


  describe "#run_attack" do
    it "calls reduce_damage on target player" do
      allow(player_1).to receive(:name) { "Obama" }
      allow(player_2).to receive(:name) { "Trump" }
      allow(game).to receive(:inactive_player) { player_2 }
      allow(game).to receive(:active_player) { player_1 }
      allow(message_log).to receive(:add_message)
      allow(game).to receive(:decide_next_event)
      allow(player_2).to receive(:receive_damage)
      expect{attack.run_attack}.not_to raise_error
    end
  end
end
