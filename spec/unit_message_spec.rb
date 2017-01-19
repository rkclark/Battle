require 'message_log.rb'

describe MessageLog do
  subject(:message_log){described_class.new}
  it {is_expected.to respond_to(:messages)}

  describe "#add_message" do
    it "adds a message to the array" do
      message_log.add_message("Hello World")
      expect(message_log.messages).to include("Hello World")
    end
  end
end
