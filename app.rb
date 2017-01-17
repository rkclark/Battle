require 'sinatra/base'

class Battle < Sinatra::Application
  get '/' do
    'Hello world!'
  end
end
