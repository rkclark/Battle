require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, "session_secret"

  get '/' do
    erb :index
  end

  post '/names' do
    session[:p1_name] = params[:p1_name]
    session[:p2_name] = params[:p2_name]
    redirect '/play'
  end

  get '/play' do
    @p1_name = session[:p1_name]
    @p2_name = session[:p2_name]
    erb :play
  end
end
