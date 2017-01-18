require 'sinatra/base'
require './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "session_secret"

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(name: params[:p1_name])
    $player_2 = Player.new(name: params[:p2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    @new_message = "#{@player_1.name} and #{@player_2.name} entered the game"
    erb :play
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    @player_1.attack(@player_2)
    @new_message = "#{@player_1.name} attacked #{@player_2.name}"
    erb :play
  end
end
