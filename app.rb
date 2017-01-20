require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
require './lib/attack.rb'
require './lib/message_log.rb'
require './lib/randomiser.rb'

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
    p params
    player_1 = Player.new(name: params[:p1_name])
    player_2 = params[:p2_name].empty? ? Player.new(name:"Computer", human: false) : Player.new(name: params[:p2_name], human: true)
    @message_log = MessageLog.new
    @game = Game.new(player_1: player_1, player_2: player_2, message_log: MessageLog.message_log_instance)
    @attack = Attack.new(game: Game.game_instance, message_log: MessageLog.message_log_instance, randomiser_module: Randomiser)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/attack' do
    p params
    Attack.attack_instance.run_attack(params[:attack])
    Attack.attack_instance.run_attack(params[:attack]) unless @game.active_player.human?
    erb :play
  end

  run! if app_file == $0
end
