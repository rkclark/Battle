require 'sinatra/base'

class Battle < Sinatra::Application
  get '/' do
    erb :index
  end

  post '/names' do
    @p1_name = params[:p1_name]
    @p2_name = params[:p2_name]
    erb :names
  end
end
