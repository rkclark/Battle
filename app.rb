require 'sinatra/base'

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
    @p1_name = $player_1.name
    @p2_name = $player_2.name
    @p1_hp = 100
    @p2_hp = 100
    erb :play
  end

  get '/attack' do
    @p1_name = $player_1.name
    @p2_name = $player_2.name
    @new_message = "#{@p1_name} attacked #{@p2_name}"
    erb :play
  end
end
