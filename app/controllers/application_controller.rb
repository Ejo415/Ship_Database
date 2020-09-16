require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "starfleet"
  end

  get "/" do
    erb :new_welcome
  end
  
  get "/error" do
    erb :error
  end


  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect to "/error"
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
