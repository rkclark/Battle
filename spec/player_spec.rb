require 'player'

describe Player do
  let(:name) { "Obama" }
  subject(:player) { described_class.new(name: name) }
  it { is_expected.to respond_to(:name) }
end
