require 'randomiser.rb'

describe Randomiser do

  subject(:randomiser) { described_class }

  it { is_expected.to respond_to(:randomise) }

  describe "#randomise" do
    it "returns a random number between 0 and 1" do
      expect(randomiser.randomise).to be_between(0,1)
    end
  end
end
