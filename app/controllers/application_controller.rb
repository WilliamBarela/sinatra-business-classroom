require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    redirect to :"/login" unless logged_in?
    erb :index
  end

  get "/login" do
    erb :login
  end

  get "/signup" do
    erb :signup
  end

  helpers do
    def current_user
      Student.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end

end
