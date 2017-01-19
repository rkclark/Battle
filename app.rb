require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
require './lib/attack.rb'
require './lib/message_log.rb'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "session_secret"

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(name: params[:p1_name])
    player_2 = Player.new(name: params[:p2_name])
    @message_log = MessageLog.new
    @game = Game.new(player_1: player_1, player_2: player_2, message_log: MessageLog.message_log_instance)
    $attack = Attack.new(game: Game.game_instance, message_log: MessageLog.message_log_instance)
    redirect '/play'
  end

  get '/play' do
    @game = Game.game_instance
    @message_log = MessageLog.message_log_instance
    erb :play
  end

  get '/attack' do
    @game = Game.game_instance
    @message_log = MessageLog.message_log_instance
    $attack.run_attack
    erb :play
  end
end
