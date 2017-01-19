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
    $message_log = MessageLog.new
    $game = Game.new(player_1: player_1, player_2: player_2, message_log: $message_log)
    $attack = Attack.new(game: $game, message_log: $message_log)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    @message_log = $message_log
    erb :play
  end

  get '/attack' do
    @game = $game
    @message_log = $message_log
    $attack.run_attack
    erb :play
  end
end
