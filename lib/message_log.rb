class MessageLog
  attr_reader :messages
  def initialize
    @messages = []
  end

  def add_message(message)
    @messages << message
  end
end
