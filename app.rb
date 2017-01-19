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

  before do
    pass if request.path_info.include?("/play|attack/")
    @game = Game.game_instance
    @message_log = MessageLog.message_log_instance
  end

  post '/names' do
    player_1 = Player.new(name: params[:p1_name])
    player_2 = Player.new(name: params[:p2_name])
    @message_log = MessageLog.new
    @game = Game.new(player_1: player_1, player_2: player_2, message_log: MessageLog.message_log_instance)
    @attack = Attack.new(game: Game.game_instance, message_log: MessageLog.message_log_instance)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/attack' do
    Attack.attack_instance.run_attack
    erb :play
  end
end
